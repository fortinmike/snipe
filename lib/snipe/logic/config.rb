require 'fileutils'
require 'psych'

module Snipe
  class Config
    FILE = File.expand_path("~/.snipe")

    attr_accessor :api_key
    attr_accessor :domain
    attr_accessor :from

    def self.exists?
      File.exists?(FILE)
    end

    def load
      yaml = File.read(FILE)
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
      File.write(FILE, yaml)
    end
  end
end
