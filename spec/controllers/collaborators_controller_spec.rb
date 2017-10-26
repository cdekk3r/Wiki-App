require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  
  let(:user) { User.create!(email: "user@user.com", password: "password") }
  let(:wiki) { Wiki.create!(title: "New title", body: "New body", private: false, user: user) }
  let(:collaborator) { Collaborator.create!(user_id: user.id, wiki_id: wiki.id) }
  
  describe 'POST create' do
    it 'redirects to the wikis show view' do
      post :create, { wiki_id: wiki.id }
      expect(response).to redirect_to(wiki)
    end

    it 'creates a collaborator for the input email and specified wiki' do
      expect(Collaborator.find_by_wiki_id(wiki.id)).to be_nil
      post :create, { wiki_id: wiki.id }
      expect(Collaborator.find_by_wiki_id(wiki.id)).not_to be_nil
    end
  end

end
