require 'rails_helper'

RSpec.describe ExamsController, :type => :controller do
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

    it "loads all of the exams into @exams" do
      exam1, exam2 = Exam.create!(date: '2014-10-10'.to_date), Exam.create!(date: '2014-10-12')
      get :index

      expect(assigns(:exams)).to match_array([exam1, exam2])
    end
  end
end