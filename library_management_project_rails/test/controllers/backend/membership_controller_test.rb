require "test_helper"

class Backend::MembershipControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get backend_membership_new_url
    assert_response :success
  end
end
