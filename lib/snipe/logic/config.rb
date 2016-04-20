require 'fileutils'
require 'psych'

module Snipe
  class Config
    CONFIG_FILE = File.expand_path("~/.snipe")

    attr_accessor :api_key
    attr_accessor :domain
    attr_accessor :from

    def load
      yaml = File.read(CONFIG_FILE)
      loaded = Psych.load(yaml)

      @api_key = loaded["api_key"]
      @domain = loaded["domain"]
      @from = loaded["from"]
    end

    def save
      to_save = {
        "api_key" => @api_key,
        "domain" => @domain,
        "from" => @from
      }

      yaml = Psych.dump(to_save)
      File.write(CONFIG_FILE, yaml)
    end
  end
end
