class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    msg = self.check_tickets + self.check_height

    if !msg.empty?
      msg.prepend("Sorry.")
    else
      self.charge_user
      self.nauseate_user
      self.please_user
      self.user.save
    end
  end

  def charge_user
    self.user.tickets -= self.attraction.tickets
  end

  def nauseate_user
    self.user.nausea += self.attraction.nausea_rating
  end

  def please_user
    self.user.happiness += self.attraction.happiness_rating
  end

  def check_height
    self.user.height < self.attraction.min_height ? " You are not tall enough to ride the #{self.attraction.name}." : ""
  end

  def check_tickets
    self.user.tickets < self.attraction.tickets ? " You do not have enough tickets to ride the #{self.attraction.name}." : ""
  end
end
