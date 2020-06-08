require 'securerandom'

class KeyGenerator
  def self.generate_key
    random_string = SecureRandom.hex
  end
end
