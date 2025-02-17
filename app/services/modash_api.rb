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
        "name" => "Lionel Messi",
        "platform" => "Instagram",
        "followers" => 20000,
        "profile_url" => "https://instagram.com/influencer1",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg"
      },
      {
        "name" => "Cristiano Ronaldo",
        "platform" => "Instagram",
        "followers" => 15000,
        "profile_url" => "https://instagram.com/influencer2",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg"
      },
      {
        "name" => "Mr. Beast",
        "platform" => "TikTok",
        "followers" => 200000,
        "profile_url" => "https://tiktok.com/@influencer3",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/c/ce/MrBeast_2023_%28cropped%29.jpg"
      },
      {
        "name" => "Taylor Swift",
        "platform" => "Twitter",
        "followers" => 5000,
        "profile_url" => "https://twitter.com/influencer4",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/a/a0/Taylor_Swift_at_the_2024_Golden_Globes_%281%29.png"
      },
    ]
  end
end
