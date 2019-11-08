require 'test_helper'

class StatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get states_create_url
    assert_response :success
  end

end
