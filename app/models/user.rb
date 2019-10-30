class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides 

  has_secure_password 

  def mood 
    unless self.nausea == nil || self.happiness == nil 
      if self.happiness > self.nausea 
        "happy"
      else 
        "sad"
      end 
    end 
  end 
end
