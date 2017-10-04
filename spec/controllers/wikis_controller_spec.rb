require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:my_wiki) { Wiki.create!(title: "New title", body: "New body", private: true, user: my_user) }
  let(:my_user) { User.create!(email: "user@user.com", password: "password") }

  before(:each) do
    sign_in my_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns Wiki.all to wiki" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end
  
  describe "WIKI create" do
    it "increases the number of Post by 1" do
      expect{post :create, wiki: {title: "New title", body: "New body", private: true}}.to change(Wiki,:count).by(1)
    end
    
    it "assigns the new wiki to @wiki" do
      post :create, wiki: {title: "New title", body: "New body", private: true}
      expect(assigns(:wiki)).to eq Wiki.last
    end
    
    it "redirects to the new wiki" do
      post :create, wiki: {title: "New title", body: "New body", private: true}
      expect(response).to redirect_to Wiki.last
    end
  end
    
end
