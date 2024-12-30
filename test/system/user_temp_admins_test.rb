require "application_system_test_case"

class UserTempAdminsTest < ApplicationSystemTestCase
  setup do
    @user_temp_admin = user_temp_admins(:one)
  end

  test "visiting the index" do
    visit user_temp_admins_url
    assert_selector "h1", text: "User temp admins"
  end

  test "should create user temp admin" do
    visit user_temp_admins_url
    click_on "New user temp admin"

    fill_in "Dni nro", with: @user_temp_admin.dni_nro
    fill_in "Email", with: @user_temp_admin.email
    fill_in "Last name", with: @user_temp_admin.last_name
    fill_in "Name", with: @user_temp_admin.name
    fill_in "Password", with: @user_temp_admin.password
    fill_in "Password confirmation", with: @user_temp_admin.password_confirmation
    click_on "Create User temp admin"

    assert_text "User temp admin was successfully created"
    click_on "Back"
  end

  test "should update User temp admin" do
    visit user_temp_admin_url(@user_temp_admin)
    click_on "Edit this user temp admin", match: :first

    fill_in "Dni nro", with: @user_temp_admin.dni_nro
    fill_in "Email", with: @user_temp_admin.email
    fill_in "Last name", with: @user_temp_admin.last_name
    fill_in "Name", with: @user_temp_admin.name
    fill_in "Password", with: @user_temp_admin.password
    fill_in "Password confirmation", with: @user_temp_admin.password_confirmation
    click_on "Update User temp admin"

    assert_text "User temp admin was successfully updated"
    click_on "Back"
  end

  test "should destroy User temp admin" do
    visit user_temp_admin_url(@user_temp_admin)
    click_on "Destroy this user temp admin", match: :first

    assert_text "User temp admin was successfully destroyed"
  end
end
