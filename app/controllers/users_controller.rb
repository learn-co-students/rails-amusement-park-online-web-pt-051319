class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_path(@user)
            
        else 
            render 'new'
        end 
    end 

    def show
        if logged_in?
            @user = User.find_by(id: session[:user_id])
        else
            redirect_to root_path
        end
    end 

    def update
        @user = User.find_by(id: session[:user_id])
        attraction = Attraction.find_by(id: params[:attraction_id])
        ride = @user.rides.build(attraction_id: attraction.id)
        ride.save 
        flash[:results] = ride.take_ride
        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :admin,
            :password,
            :nausea,
            :happiness,
            :height,
            :tickets
        )
    end 
end
