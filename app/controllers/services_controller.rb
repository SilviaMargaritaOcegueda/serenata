class ServicesController < ApplicationController
  def new
    @genres = %w[Alternative Balada Banda-sinaloense Blues Children's Classical
                 Dance Electronic Hip-Hop/Rap Instrumental Jazz Latin Mariachi
                 New-age Opera Parody Pop Reggae Regional Religious Rock Vocal]

    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to "#"
    else
      render "new"
    end
  end

  # def edit

  # end

  # def update

  # end

  private

  def service_params
    params.require(:service).permit(:name, :rate, :user_id, :photo)
  end
end
