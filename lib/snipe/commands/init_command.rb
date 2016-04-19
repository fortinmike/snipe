require "highline"
require "snipe/config"

module Snipe
  class InitCommand < Command
    self.command = "init"
    self.summary = "Configures snipe for sending email"

    def validate!
      # Prevent super from validating stuff
    end

    def run
      config = Config.new
      cli = HighLine.new
      config.api_key = cli.ask("MailGun API Key?")
      config.from = cli.ask("Default \"from\" address?")  { |q|
        q.validate = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
        # TODO: Better response on validation error
      }
      config.save
      puts "All done! You can now send email with snipe."
    end
  end
end
