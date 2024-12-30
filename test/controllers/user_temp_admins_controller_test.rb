require "test_helper"

class UserTempAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_temp_admin = user_temp_admins(:one)
  end

  test "should get index" do
    get user_temp_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_user_temp_admin_url
    assert_response :success
  end

  test "should create user_temp_admin" do
    assert_difference("UserTempAdmin.count") do
      post user_temp_admins_url, params: { user_temp_admin: { dni_nro: @user_temp_admin.dni_nro, email: @user_temp_admin.email, last_name: @user_temp_admin.last_name, name: @user_temp_admin.name, password: @user_temp_admin.password, password_confirmation: @user_temp_admin.password_confirmation } }
    end

    assert_redirected_to user_temp_admin_url(UserTempAdmin.last)
  end

  test "should show user_temp_admin" do
    get user_temp_admin_url(@user_temp_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_temp_admin_url(@user_temp_admin)
    assert_response :success
  end

  test "should update user_temp_admin" do
    patch user_temp_admin_url(@user_temp_admin), params: { user_temp_admin: { dni_nro: @user_temp_admin.dni_nro, email: @user_temp_admin.email, last_name: @user_temp_admin.last_name, name: @user_temp_admin.name, password: @user_temp_admin.password, password_confirmation: @user_temp_admin.password_confirmation } }
    assert_redirected_to user_temp_admin_url(@user_temp_admin)
  end

  test "should destroy user_temp_admin" do
    assert_difference("UserTempAdmin.count", -1) do
      delete user_temp_admin_url(@user_temp_admin)
    end

    assert_redirected_to user_temp_admins_url
  end
end
