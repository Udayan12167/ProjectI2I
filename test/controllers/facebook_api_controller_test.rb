require 'test_helper'

class FacebookApiControllerTest < ActionController::TestCase
  test "should get friends" do
    get :friends
    assert_response :success
  end

end
