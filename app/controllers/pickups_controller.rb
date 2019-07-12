class PickupsController < ApplicationController
  before_action :set_pickup, only: [:show, :edit, :update, :destroy]

  
  def index
    	if user_signed_in? 
            if current_user.is_driver?
               redirect_to :controller => 'trips', :action => 'index'
            else
            @pickups = Pickup.all
            end
        else
        redirect_to user_session_path
        end	
  end

  def show
  end

  def new
    @pickup = current_user.pickups.new
    @pickup.places.new
   
  end

  def edit
  end

  
  def create
     @pickup = current_user.pickups.new(pickup_params)
      if @pickup.save
       redirect_to @pickup, notice: "Pickup added successful"
      else
        render "new"
      end
  end

  def update
    respond_to do |format|
      if @pickup.update(pickup_params)
        format.html { redirect_to @pickup, notice: 'Pickup was successfully updated.' }
        format.json { render :show, status: :ok, location: @pickup }
      else
        format.html { render :edit }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @pickup.destroy
    respond_to do |format|
      format.html { redirect_to pickups_url, notice: 'Pickup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_pickup
      @pickup = Pickup.find(params[:id])
      @source = Place.find_by_pickup_id(@pickup.id)
    end

    def pickup_params
      params.require(:pickup).permit(:source, :destination, :departure_time)
    end
end
