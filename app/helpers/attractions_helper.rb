module AttractionsHelper

    def attractions_link(attraction)
        if current_user.admin
            link_to "Show #{attraction.name}", attraction_path(attraction)
        else
            link_to "Go on #{attraction.name}", attraction_path(attraction)
        end
    end

    def attraction_action_link(attraction)
        if current_user.admin
            link_to "Edit Attraction", edit_attraction_path(attraction)
        else
            @ride = Ride.new(user_id: current_user.id, attraction_id: attraction.id)
            render "rides/form"
        end
    end
end
