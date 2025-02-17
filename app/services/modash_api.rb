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
        "followers" => 50000,
        "profile_url" => "https://www.instagram.com/leomessi/",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg"
      },
      {
        "name" => "Cristiano Ronaldo",
        "platform" => "Instagram",
        "followers" => 15000,
        "profile_url" => "https://www.instagram.com/cristiano/",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg"
      },
      {
        "name" => "Mr. Beast",
        "platform" => "TikTok",
        "followers" => 200000,
        "profile_url" => "https://www.tiktok.com/@mrbeast?lang=es",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/c/ce/MrBeast_2023_%28cropped%29.jpg"
      },
      {
        "name" => "Taylor Swift",
        "platform" => "Twitter",
        "followers" => 5000,
        "profile_url" => "https://x.com/taylorswift13?lang=es",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/a/a0/Taylor_Swift_at_the_2024_Golden_Globes_%281%29.png"
      },      {
        "name" => "El Rubius",
        "platform" => "Instagram",
        "followers" => 20000,
        "profile_url" => "https://www.instagram.com/elrubiuswtf/",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/d/df/El_Rubius_en_el_Festival_de_cinema_de_Sitges_2018_%28recorte%29.jpg"
      },
      {
        "name" => "Khaby Lame",
        "platform" => "Instagram",
        "followers" => 15000,
        "profile_url" => "https://www.instagram.com/khaby00/",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/1/15/KhabyLame.jpg"
      },
      {
        "name" => "Luisito Comunica",
        "platform" => "TikTok",
        "followers" => 200000,
        "profile_url" => "https://www.tiktok.com/@luisitocomunica?lang=es",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/7/73/De_clase_media_endeudada_a_empresario_exitoso_-_Marcas_Que_Impactan_Gran_Malo_con_LuisitoComunica.3.png"
      },
      {
        "name" => "Bella Poarch",
        "platform" => "Twitter",
        "followers" => 5000,
        "profile_url" => "https://x.com/bellapoarch",
        "image" => "https://upload.wikimedia.org/wikipedia/commons/a/a4/Bella_Poarch_smiling.jpg"
      },
    ]
  end
end
