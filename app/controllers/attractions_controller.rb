class AttractionsController < ApplicationController
  before_action :check_login, only: [:index, :show]
  before_action :set_attraction, only: [:show, :edit, :update]
  
  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    admin_only
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)

    redirect_to attraction_path(attraction)
  end

  def edit
    admin_only
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
    end

    def set_attraction
      @attraction = Attraction.find_by(:id => params[:id])
    end
end
