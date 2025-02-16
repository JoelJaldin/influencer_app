class ModashApi
  include HTTParty
  base_uri 'https://api.modash.io/v1'

  def initialize
    api_key = ENV['MODASH_API_KEY']
    @headers = {
      'Authorization' => "Bearer #{api_key}",
      'Content-Type' => 'application/json'
    }
  end

  def fetch_influencers(query)
    # Datos de prueba simulando la respuesta de la API
    [
      {
        "name" => "Influencer 1",
        "platform" => "Instagram",
        "followers" => 10000,
        "profile_url" => "https://instagram.com/influencer1"
      },
      {
        "name" => "Influencer 2",
        "platform" => "Instagram",
        "followers" => 15000,
        "profile_url" => "https://instagram.com/influencer2"
      }
    ]
  end
end
