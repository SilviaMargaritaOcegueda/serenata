class ServicesController < ApplicationController
  def index
    @services = current_user.services
  end

  def show
    @service = Service.find(params[:id])
  end

  def genre
    @services = Service.where(name: params[:name][:name])
  end

  def new
    @genres = %w[Alternative Balada Banda-sinaloense Blues Children's Classical
                 Dance Electronic Hip-Hop/Rap Instrumental Jazz Latin Mariachi
                 New-age Opera Parody Pop Reggae Regional Religious Rock Vocal]

    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save!
      redirect_to services_path
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
    params.require(:service).permit(:name, :rate, :photo)
  end
end
