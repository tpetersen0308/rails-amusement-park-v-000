class RidesController < ApplicationController

  def create
    ride = Ride.new(:attraction_id => params.require(:ride).permit(:attraction_id).values.first, :user_id => current_user.id)
    ride.save

    flash[:notice] = ride.take_ride
    redirect_to user_path(ride.user)
  end
end
