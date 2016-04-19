require 'fileutils'
require 'psych'

module Snipe
  class Config
    attr_accessor :api_key
    attr_accessor :from

    def initialize(settings)
      @settings = settings
    end

    def load
      yaml = File.read(@settings.config_file)
      loaded = Psych.load(yaml)

      @api_key = loaded["api_key"]
      @from = loaded["from"]
    end

    def save
      to_save = {
        "api_key" => @api_key,
        "from" => @from
      }

      yaml = Psych.dump(to_save)
      File.write(@settings.config_file, yaml)
    end
  end
end
