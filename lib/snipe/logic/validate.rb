module Snipe
  class Validate
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    def self.email!(email)
      EMAIL_REGEX =~ email
    end
  end
end
