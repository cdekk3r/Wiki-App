require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.create!(email: "user@bloc.com", password: "password") }
    
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to allow_value("user@bloc.com").for(:email) }
    
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    
    it { should have_many(:wikis) }
    
    describe "attributes" do
        it "should have email and password attributes" do
            expect(user).to have_attributes(email: "user@bloc.com", password: "password")
        end
        
        it "responds to role" do
            expect(user).to respond_to(:role)
        end
        
        it "responds to admin?" do
            expect(user).to respond_to(:admin?)
        end
        
        it "responds to premium?" do
            expect(user).to respond_to(:premium?)
        end
        
        it "responds to standard?" do
            expect(user).to respond_to(:standard?)
        end
    end
end
