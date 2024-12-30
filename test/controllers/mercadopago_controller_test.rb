require "test_helper"

class MercadopagoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mercadopago_index_url
    assert_response :success
  end

  test "should get show" do
    get mercadopago_show_url
    assert_response :success
  end

  test "should get new" do
    get mercadopago_new_url
    assert_response :success
  end
end
