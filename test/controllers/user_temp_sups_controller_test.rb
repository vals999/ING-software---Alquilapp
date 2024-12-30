require "test_helper"

class UserTempSupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_temp_sup = user_temp_sups(:one)
  end

  test "should get index" do
    get user_temp_sups_url
    assert_response :success
  end

  test "should get new" do
    get new_user_temp_sup_url
    assert_response :success
  end

  test "should create user_temp_sup" do
    assert_difference("UserTempSup.count") do
      post user_temp_sups_url, params: { user_temp_sup: { dni_nro: @user_temp_sup.dni_nro, email: @user_temp_sup.email, last_name: @user_temp_sup.last_name, name: @user_temp_sup.name, password: @user_temp_sup.password } }
    end

    assert_redirected_to user_temp_sup_url(UserTempSup.last)
  end

  test "should show user_temp_sup" do
    get user_temp_sup_url(@user_temp_sup)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_temp_sup_url(@user_temp_sup)
    assert_response :success
  end

  test "should update user_temp_sup" do
    patch user_temp_sup_url(@user_temp_sup), params: { user_temp_sup: { dni_nro: @user_temp_sup.dni_nro, email: @user_temp_sup.email, last_name: @user_temp_sup.last_name, name: @user_temp_sup.name, password: @user_temp_sup.password } }
    assert_redirected_to user_temp_sup_url(@user_temp_sup)
  end

  test "should destroy user_temp_sup" do
    assert_difference("UserTempSup.count", -1) do
      delete user_temp_sup_url(@user_temp_sup)
    end

    assert_redirected_to user_temp_sups_url
  end
end
