class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

 
  def index
    if user_signed_in? 
		    if current_user.is_driver?
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
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:source, :destination, :departure_time, :numberOfSeats)
    end
end
