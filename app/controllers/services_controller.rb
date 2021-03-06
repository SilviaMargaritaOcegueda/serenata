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
    @genres = Service::GENRES
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

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy if @service.user == current_user
    redirect_to services_path
  end

  # def destroy_pop
  #   pops = Service.where(name: 'Pop')
  #   pops.each.destroy
  # end
  # destroy_pop

  private

  def service_params
    params.require(:service).permit(:name, :rate, :photo, :demo_link)
  end
end
