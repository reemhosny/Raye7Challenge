require 'rails_helper'

RSpec.describe TripsController, type: :controller do
    context "Get#index" do
        it "it returnes a success responce" do
            get :index
            expect(response).to be_success  
            
        end
        
        
    end
    context "Get#index" do
        it "it returnes a success responce" do
          trip = Trip.new(source: "abas elakaad", destination: "gooo" , numberOfSeats: "5", user_id: "13")
            get :show, params: {id: trip.to_param }
            expect(response).to be_success  
            
        end
        
        
    end
    

end
