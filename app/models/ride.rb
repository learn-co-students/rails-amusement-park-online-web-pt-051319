class Ride < ActiveRecord::Base

    belongs_to :user
  belongs_to :attraction

  def take_ride
    if allowed_to_ride
      went_for_a_ride
    elsif has_enough_tickets && !is_tall_enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !has_enough_tickets && is_tall_enough
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    else
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  def went_for_a_ride
    self.user.update(happiness: self.user.happiness + self.attraction.happiness_rating,
                     tickets: self.user.tickets - self.attraction.tickets,
                     nausea: self.user.nausea + self.attraction.nausea_rating)
                     
    "Thanks for riding the #{self.attraction.name}!"
  end

  private
  def is_tall_enough
     self.user.height >= self.attraction.min_height ? true : false
  end

  def has_enough_tickets
    self.user.tickets >= self.attraction.tickets ? true : false
  end

  def allowed_to_ride
    is_tall_enough && has_enough_tickets ? true : false
  end
end

