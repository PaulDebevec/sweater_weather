class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :password

  def generate_api_key
    key = KeyGenerator.generate_key
    self.update(api_key: key)
  end
end
