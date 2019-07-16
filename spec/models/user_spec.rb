require 'rails_helper'

RSpec.describe User, type: :model do
context "validation tests" do
  it "ensures full_name presence" do
    user = User.new(phone_number: "01068044229" , email: "reem.hosny@lareinagowns.com").save
     expect(user).to  eq(false)
  end
  it "ensures phone_number presence" do
    user = User.new(full_name: "reem.hosny" , email: "reem.hosny@lareinagowns.com").save
     expect(user).to  eq(false)
    
  end
  it "ensures email presence" do
    user = User.new(full_name: "reem.hosny" , phone_number: "01068044229").save
     expect(user).to  eq(false)
    
  end
     
end

end
