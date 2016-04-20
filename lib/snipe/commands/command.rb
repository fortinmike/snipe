require "claide"
require "mailgun"

require "snipe/snipe_exception"
require "snipe/info"
require "snipe/logic/config"

module Snipe
  class Command < CLAide::Command
    self.command = "snipe"
    self.version = VERSION
    self.description = DESCRIPTION

    def self.options
      [
        ['--target|--to', 'The address to send the email to'],
        ['--message', 'A message to send'],
        ['[--subject]', 'Derived from the message by default'],
        ['[--from]', 'Override the default "from" address'],
      ].concat(super)
    end

    def initialize(argv)
      assert_configured!

      config = Config.new
      config.load

      @api_key = config.api_key
      @domain = config.domain
      @from = argv.option("f") || argv.option("from") || config.from
      @to =  argv.option("t") || argv.option("to") || argv.option("target")
      @message = argv.option("message")
      @subject = argv.option("subject") || create_subject(@message)

      super
    end

    def run
      client = Mailgun::Client.new(@api_key)
      params = { from: @from, to: @to, subject: @subject, text: @message }
      response = client.send_message(@domain, params)

      output_message = response.code == 200 ? "Email Sent" : "Error"
      body = JSON.parse(response.body)
      puts "[#{response.code}] #{output_message} : #{body["message"]}"
    end

    def assert_configured!
      fail SnipeException, "Run `snipe init` first!" unless Config.exists?
    end

    def validate!
      help! "You must provide a valid `--from`" unless Validate.email!(@from)
      help! "You must provide a valid `--target`" unless Validate.email!(@to)
      help! "You must provide a `--message`" unless @message
    end

    def create_subject(message)
      return nil unless message
      message.split(" ").take(8).join(" ")
    end

    def self.report_error(exception)
      if exception.instance_of?(SnipeException)
        puts exception.message
        exit 1
      end
      fail exception
    end
  end
end
