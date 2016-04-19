require "claide"

require "snipe/info"
require "snipe/snipe_exception"

module Snipe
  class Command < CLAide::Command
    self.abstract_command = true
    self.command = "snipe"
    self.version = VERSION
    self.description = DESCRIPTION
    
    def self.report_error(exception)
      if exception.instance_of?(SnipeException)
        Console.log_error(exception.message)
        exit 1
      end
      fail exception
    end
    
    def initialize(argv)
      @argv = argv
      super
    end
    
    def run
      puts "TODO: Send email here"
    end

    def validate!
      super
      help! "TODO: Validate input here"
    end
  end
end
