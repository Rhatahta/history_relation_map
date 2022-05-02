require 'rails_helper'

RSpec.describe "People", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/people/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/people/show"
      expect(response).to have_http_status(:success)
    end
  end
end