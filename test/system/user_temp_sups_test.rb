require "application_system_test_case"

class UserTempSupsTest < ApplicationSystemTestCase
  setup do
    @user_temp_sup = user_temp_sups(:one)
  end

  test "visiting the index" do
    visit user_temp_sups_url
    assert_selector "h1", text: "User temp sups"
  end

  test "should create user temp sup" do
    visit user_temp_sups_url
    click_on "New user temp sup"

    fill_in "Dni nro", with: @user_temp_sup.dni_nro
    fill_in "Email", with: @user_temp_sup.email
    fill_in "Last name", with: @user_temp_sup.last_name
    fill_in "Name", with: @user_temp_sup.name
    fill_in "Password", with: @user_temp_sup.password
    click_on "Create User temp sup"

    assert_text "User temp sup was successfully created"
    click_on "Back"
  end

  test "should update User temp sup" do
    visit user_temp_sup_url(@user_temp_sup)
    click_on "Edit this user temp sup", match: :first

    fill_in "Dni nro", with: @user_temp_sup.dni_nro
    fill_in "Email", with: @user_temp_sup.email
    fill_in "Last name", with: @user_temp_sup.last_name
    fill_in "Name", with: @user_temp_sup.name
    fill_in "Password", with: @user_temp_sup.password
    click_on "Update User temp sup"

    assert_text "User temp sup was successfully updated"
    click_on "Back"
  end

  test "should destroy User temp sup" do
    visit user_temp_sup_url(@user_temp_sup)
    click_on "Destroy this user temp sup", match: :first

    assert_text "User temp sup was successfully destroyed"
  end
end
