require "open-uri"

class InfluencersController < ApplicationController
  def index
    if params[:query].present?
      @influencers = Influencer.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @influencers = Influencer.order(created_at: :asc)
    end
  end

  def create
    @influencer = Influencer.new(influencer_params)

    if @influencer.save
      respond_to do |format|
        format.html { redirect_to influencers_path }
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.remove("modal"), # Cierra el modal actual
            turbo_stream.append("influencers-list", # Agrega el nuevo influencer a la lista
              partial: "influencers/partials/influencer", locals: { influencer: @influencer }
            )
          ]
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @influencer = Influencer.find(params[:id])
    @influencer.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to influencers_path, notice: "Influencer eliminado." }
    end
  end

  private

  def influencer_params
    params.require(:influencer).permit(:name, :platform, :followers, :profile_url, :image)
  end
end
