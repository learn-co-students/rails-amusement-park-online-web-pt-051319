class RidesController < ApplicationController

    def create
        ride = Ride.create(rides_params)
        flash[:notice] = ride.take_ride
        redirect_to user_path(ride.user)
    end

    private

    def rides_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end