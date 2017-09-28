require 'rails_helper'

RSpec.describe Wiki, type: :model do
    let(:wiki) { Wiki.create!(title: "New title", body: "New body", private: true) }
  
    describe "attributes" do
        it "has title and body attributes" do
         expect(wiki).to have_attributes(title: "New title", body: "New body")
        end
    
        it "is private by default" do
            expect(wiki.private).to be(true)
        end
    end
    
end
