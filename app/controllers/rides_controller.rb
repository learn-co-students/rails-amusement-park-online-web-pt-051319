class RidesController < ApplicationController

    def create
        ride = Ride.create(rides_params)
        ride.take_ride
        redirect_to attraction_path(ride.attraction)
    end

    private

    def rides_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end