class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true
  

  has_many :rides
  has_many :attractions, through: :rides

  before_create :cleanup_string_input

  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end


  def cleanup_string_input
    self.happiness = self.happiness.to_i
    self.nausea = self.nausea.to_i
  end
end
