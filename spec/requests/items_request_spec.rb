require 'rails_helper'

RSpec.describe "Items", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/items/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/items/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /remove" do
    it "returns http success" do
      get "/items/remove"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /view" do
    it "returns http success" do
      get "/items/view"
      expect(response).to have_http_status(:success)
    end
  end

end
