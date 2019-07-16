require 'rails_helper'

RSpec.describe PickupsController, type: :controller do
    context "Get#index" do
        it "it returnes a success responce" do
            get :index
            expect(response).to be_success  
            
        end
        
        
    end
    context "Get#index" do
        it "it returnes a success responce" do
          pickup = Pickup.new(source: "abas elakaad", destination: "gooo")
            get :show, params: {id: trip.to_param }
            expect(response).to be_success  
            
        end
        
        
    end
    


end
