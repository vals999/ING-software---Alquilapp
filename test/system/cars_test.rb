require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    @car = cars(:one)
  end

  test "visiting the index" do
    visit cars_url
    assert_selector "h1", text: "Cars"
  end

  test "should create car" do
    visit cars_url
    click_on "New car"

    fill_in "Brand", with: @car.brand
    fill_in "Car number", with: @car.car_number
    fill_in "Color", with: @car.color
    fill_in "Fuel", with: @car.fuel
    fill_in "Integer", with: @car.integer
    check "Is available" if @car.is_available
    check "Is enable" if @car.is_enable
    fill_in "Model car", with: @car.model_car
    fill_in "Patent", with: @car.patent
    fill_in "Seats", with: @car.seats
    fill_in "String", with: @car.string
    fill_in "Transmision", with: @car.transmision
    fill_in "Year model", with: @car.year_model
    click_on "Create Car"

    assert_text "Car was successfully created"
    click_on "Back"
  end

  test "should update Car" do
    visit car_url(@car)
    click_on "Edit this car", match: :first

    fill_in "Brand", with: @car.brand
    fill_in "Car number", with: @car.car_number
    fill_in "Color", with: @car.color
    fill_in "Fuel", with: @car.fuel
    fill_in "Integer", with: @car.integer
    check "Is available" if @car.is_available
    check "Is enable" if @car.is_enable
    fill_in "Model car", with: @car.model_car
    fill_in "Patent", with: @car.patent
    fill_in "Seats", with: @car.seats
    fill_in "String", with: @car.string
    fill_in "Transmision", with: @car.transmision
    fill_in "Year model", with: @car.year_model
    click_on "Update Car"

    assert_text "Car was successfully updated"
    click_on "Back"
  end

  test "should destroy Car" do
    visit car_url(@car)
    click_on "Destroy this car", match: :first

    assert_text "Car was successfully destroyed"
  end
end
