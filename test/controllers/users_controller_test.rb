require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get add_admin" do
    get users_add_admin_url
    assert_response :success
  end

end
