namespace :db do
  desc "Initialize mock influencers"
  task initialize_mock_influencers: :environment do
    modash_api = ModashApi.new
    mock_influencers = modash_api.fetch_influencers("some query")

    mock_influencers.each do |mock_influencer|
      existing_influencer = Influencer.find_by(profile_url: mock_influencer["profile_url"])

      unless existing_influencer
        influencer = Influencer.new(
          name: mock_influencer["name"],
          platform: mock_influencer["platform"],
          followers: mock_influencer["followers"],
          profile_url: mock_influencer["profile_url"]
        )

        if mock_influencer["image"].present?
          begin
            downloaded_image = URI.open(mock_influencer["image"])
            influencer.image.attach(io: downloaded_image, filename: "mock_image.jpg")
          rescue OpenURI::HTTPError, Errno::ENOENT => e
            logger.error "Error al descargar la imagen: #{e.message}"
          end
        end

        influencer.save! if influencer.valid?
      end
    end

    puts "Mock influencers initialized successfully!"
  end
end
