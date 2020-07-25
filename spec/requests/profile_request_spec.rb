require 'rails_helper'

RSpec.describe "Profiles", type: :request do

  describe "GET /user_profile" do
    it "returns http success" do
      get "/profile/user_profile"
      expect(response).to have_http_status(:success)
    end
  end

end
