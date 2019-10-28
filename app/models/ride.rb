class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !enough_tickets? && !tall_enough?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !tall_enough?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            self.user.tickets = self.user.tickets - self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
        end
    end

    private
    
    def enough_tickets?
        attraction.tickets < user.tickets
    end

    def tall_enough?
        attraction.min_height < user.height
    end

end
