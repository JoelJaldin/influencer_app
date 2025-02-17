class AddImageToInfluencers < ActiveRecord::Migration[7.1]
  def change
    add_column :influencers, :image, :string
  end
end
