require 'rails_helper'

RSpec.describe NtcmarshalsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end

    it "loads all of the marshals into @marshals" do
      marshal1, marshal2 = Ntcmarshal.create!(name: "John Smith"), Ntcmarshal.create!(name: "Jane Doe")
      get :index

      expect(assigns(:ntcmarshals)).to match_array([marshal1, marshal2])
    end
  end

  describe "GET #show" do
    before { @marshal = Ntcmarshal.create!(id: 1, name: "John Smith")}

    it "assigns the requested ntcmarshal to @marshal" do
      get :show, id: @marshal
      expect(assigns(:ntcmarshal)).to eq(@marshal)
    end

    it "renders the show template" do
      get :show, id: @marshal
      expect(response).to render_template :show
    end
  end
end
