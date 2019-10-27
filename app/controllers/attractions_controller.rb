class AttractionsController < ApplicationController
  # before_action :require_logged_in

  # def edit
  #   @attraction = Attraction.find_by(id: params[:id])
  # end

  # def index
  #   @attractions = Attraction.all
  #   @user = current_user
  # end

  # def new
  #   if current_user.is_admin?
  #     @attraction = Attraction.new
  #   else
  #     redirect_to user_path(current_user)
  #   end
  # end

  # def show
  #   # @ride = Ride.new
  #   @attraction = Attraction.find(params[:id])
  #   @user = current_user
  # end

  # def create
  #   @attraction = Attraction.new(attraction_params)
  #   respond_to do |format|
  #     if @attraction.save
  #       format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
  #     else
  #       format.html { render :new }
  #     end
  #   end
  # end

  
  # def destroy
  #   @attraction.destroy
  #   respond_to do |format|
  #     format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
  #   end
  # end

  # private

  # # def set_attraction
  # #   @attraction = Attraction.find(params[:id])
  # # end

  # def attraction_params
  #   params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  # end

  before_action :find_attraction, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private
  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
