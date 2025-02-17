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
      },
      {
        "name" => "Influencer 3",
        "platform" => "TikTok",
        "followers" => 200000,
        "profile_url" => "https://tiktok.com/@influencer3"
      },
      {
        "name" => "Influencer 4",
        "platform" => "Twitter",
        "followers" => 5000,
        "profile_url" => "https://twitter.com/influencer4"
      },
      {
        "name" => "Influencer 5",
        "platform" => "YouTube",
        "followers" => 250000,
        "profile_url" => "https://youtube.com/influencer5"
      },
      {
        "name" => "Influencer 6",
        "platform" => "Facebook",
        "followers" => 30000,
        "profile_url" => "https://facebook.com/influencer6"
      },
      {
        "name" => "Influencer 7",
        "platform" => "Instagram",
        "followers" => 180000,
        "profile_url" => "https://instagram.com/influencer7"
      },
      {
        "name" => "Influencer 8",
        "platform" => "LinkedIn",
        "followers" => 40000,
        "profile_url" => "https://linkedin.com/in/influencer8"
      }
    ]
  end
end
