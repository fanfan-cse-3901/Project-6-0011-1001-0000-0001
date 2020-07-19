require 'rails_helper'

RSpec.describe "Profiles", type: :request do

  describe "GET /userProfile" do
    it "returns http success" do
      get "/profile/userProfile"
      expect(response).to have_http_status(:success)
    end
  end

end
