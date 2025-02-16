class CreateInfluencers < ActiveRecord::Migration[7.1]
  def change
    create_table :influencers do |t|
      t.string :name
      t.string :platform
      t.integer :followers
      t.string :profile_url

      t.timestamps
    end
  end
end
