require 'faraday'
require 'faraday_middleware'

class EspertoAcademy < ApiConnection
  def self.endpoint
    Rails.configuration.esperto_academy[:academy_url]
  end
end
