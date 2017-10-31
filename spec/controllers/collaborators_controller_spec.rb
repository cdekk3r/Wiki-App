require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  before do
    @user = User.new(email: "example@example.com", password: "helloworld")
    @user.skip_confirmation!
    @user.save
  end
  
  let(:wiki) { Wiki.create!(title: "New title", body: "New body", private: false, user: @user) }
  
  describe 'POST create' do
    it 'redirects to the wikis show view' do
      post :create, { wiki_id: wiki.id }
      expect(response).to redirect_to(wiki)
    end

    it 'creates a collaborator for the input email and specified wiki' do
      expect(@user.collaborators.find_by_wiki_id(wiki.id)).to be_nil
      post :create, { wiki_id: wiki.id }
      expect(@user.collaborators.find_by_wiki_id(wiki.id)).not_to be_nil
    end
  end

end
