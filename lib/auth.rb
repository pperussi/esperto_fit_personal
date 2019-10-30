require 'jwt'

class Auth
  ALGORITHM = 'HS256'
  AUTH_SECRET = ENV['AUTH_SECRET']

  def self.issue(payload)
    JWT.encode(
        payload,
        AUTH_SECRET,
        ALGORITHM)
  end
end