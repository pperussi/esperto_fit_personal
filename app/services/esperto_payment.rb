require 'faraday'
require 'faraday_middleware'

class EspertoPayment < ApiConnection
  def self.endpoint
    Rails.configuration.esperto_academy[:payment_url]
  end
end
