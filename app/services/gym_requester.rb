require 'faraday'
require 'faraday_middleware'

class GymRequester
    def self.call(url:)
        EspertoAcademy.client.get do |req|
            password = ENV['PASSWORD']
            req.headers['password'] = Auth.issue(password)
            req.url url
        end
    end
end