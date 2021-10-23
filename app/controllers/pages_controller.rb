class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @genres = %w[Alternative Balada Banda-sinaloense Blues Children's Classical
                 Dance Electronic Hip-Hop/Rap Instrumental Jazz Latin Mariachi
                 New-age Opera Parody Pop Reggae Regional Religious Rock Vocal]
  end
end
