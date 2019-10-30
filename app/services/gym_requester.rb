require 'faraday'
require 'faraday_middleware'

class GymRequester
    def self.call(url:)
        EspertoAcademy.client.get do |req|
            payload = {
                user_id: 1, token_type: 'client_a2', exp: 4.hours.from_now.to_i
              }
            req.headers['Token'] = Auth.issue(payload)
            req.url url
        end
    end

    def self.login
        EspertoAcademy.client.post do |req|
            req.params = {email: 'admin@espertofit.com.br', password: '123456'}
            req.url "employee_auth"
        end
    end
end