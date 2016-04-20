require "highline"
require "snipe/logic/config"
require "snipe/logic/validate"

module Snipe
  class InitCommand < Command
    self.command = "init"
    self.summary = "Configures snipe for sending email"

    def initialize(argv)
      # Prevent super from initializing stuff
    end

    def validate!
      # Prevent super from validating stuff
    end

    def run
      config = Config.new
      cli = HighLine.new

      config.api_key = cli.ask("MailGun API Key?")
      config.domain = cli.ask("Sending Domain?")
      config.from = cli.ask("Default \"From\" Address?")  { |q|
        q.validate = Validate::EMAIL_REGEX
        # TODO: Better response on validation error
      }

      config.save

      puts "All done! You can now send email with snipe."
    end
  end
end
