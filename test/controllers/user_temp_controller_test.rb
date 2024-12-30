require "test_helper"

class UserTempControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_temp_index_url
    assert_response :success
  end

  test "should get show" do
    get user_temp_show_url
    assert_response :success
  end

  test "should get new" do
    get user_temp_new_url
    assert_response :success
  end
end
