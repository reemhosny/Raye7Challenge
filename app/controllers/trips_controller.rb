class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

 
  def index
    if user_signed_in? 
		    if current_user.driver?
		    	@trips = current_user.trips.all
		    else
		    redirect_to :controller => 'pickups', :action => 'index'
	    	end
		else
	    redirect_to user_session_path
	    end	
  end

  
  def show
  end

  
  def new
    @trip = current_user.trips.new
		@trip.places.new
  end

  
  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id=current_user.id
      if @trip.save
			 redirect_to @trip, notice: "Trip added successful"
			else
				render "new"
			end
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
    end
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
      @source = Place.find_by_pickup_id(@trip.id)

    end

    def trip_params
      params.require(:trip).permit(:source, :destination, :departure_time, :numberOfSeats)
    end
end
