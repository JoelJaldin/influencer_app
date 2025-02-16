class InfluencersController < ApplicationController
  def index
    @influencers = Influencer.order(params[:sort] || :name)
  end

  def create
    @influencer = Influencer.new(influencer_params)
    if @influencer.save
      respond_to do |format|
        format.html { redirect_to influencers_path, notice: 'Influencer creado exitosamente.' }
        format.turbo_stream
      end
    else
      render :index
    end
  end

  private

  def influencer_params
    params.require(:influencer).permit(:name, :platform, :followers, :profile_url)
  end
end
