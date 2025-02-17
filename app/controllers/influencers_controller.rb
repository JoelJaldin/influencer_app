class InfluencersController < ApplicationController
  def index
    if params[:query].present?
      @influencers = Influencer.where("name ILIKE ?", "%#{params[:query]}%")
    else
      # Obtener datos de la base de datos ordenados por fecha de creación ascendente
      db_influencers = Influencer.order(created_at: :asc)

      # Obtener datos mockeados
      modash_api = ModashApi.new
      mock_influencers = modash_api.fetch_influencers("some query")
      mock_objects = mock_influencers.map do |mock_influencer|
        Influencer.new(mock_influencer)
      end

      # Filtrar mock_objects para eliminar duplicados que ya existen en la base de datos
      existing_urls = db_influencers.pluck(:profile_url)
      unique_mock_objects = mock_objects.reject { |mock| existing_urls.include?(mock.profile_url) }

      # Invertimos el orden de la concatenación: primero mock_objects y luego db_influencers
      @influencers = unique_mock_objects + db_influencers
    end
  end

# app/controllers/influencers_controller.rb
  def create
    @influencer = Influencer.new(influencer_params)

    if @influencer.save
      respond_to do |format|
        format.html { redirect_to influencers_path }
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.remove("modal"),         # Cierra el modal
            turbo_stream.append("influencers-list", # Asegúrate que el contenedor tenga el id correcto
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
