require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get bookings" do
    get users_bookings_url
    assert_response :success
  end
end
