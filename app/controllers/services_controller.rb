class ServicesController < ApplicationController
  # before_action :add_index_breadcrumb, only: [:show, :new, :edit]

  def index
    @services = current_user.services
    # add_breadcrumb("My services")
    # raise
  end

  def show
    @service = Service.find(params[:id])
    # add_breadcrumb(artist_name_or_genre)
  end

  def genre
    @services = Service.where(name: params[:name][:name])
    # add_breadcrumb(params[:name][:name])
    # raise
  end

  def new
    @genres = Service::GENRES
    @service = Service.new
    # add_breadcrumb("New")
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
    # add_breadcrumb(@service.name, service_path(@service))
    # add_breadcrumb("Edit")
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

  # def add_index_breadcrumb
  #   add_breadcrumb(index_label, index_or_genre)
  # end

  # def index_label
  #   @service = Service.find(params[:id])
  #   if @service.user == current_user
  #     return "My services"
  #   else
  #     return @service.name
  #   end
  # end

  # def index_or_genre
  #   if current_user.user_type == "Artist"
  #     return services_path
  #   else
  #     return genre_services_path
  #   end
  # end

  # def artist_name_or_genre
  #   @service = Service.find(params[:id])
  #   if @service.user == current_user
  #     return @service.name
  #   else
  #     return @service.user.name
  #   end
  # end
end
