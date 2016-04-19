module Snipe
  class InitCommand < Command
    self.command = "init"
    self.summary = "Configures snipe for sending email"

    def run
      puts "Initialize here!"
    end
  end
end
