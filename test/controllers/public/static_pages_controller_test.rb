require 'test_helper'

class Public::StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get public_static_pages_home_url
    assert_response :success
  end

  test "should get end" do
    get public_static_pages_end_url
    assert_response :success
  end

  test "should get about" do
    get public_static_pages_about_url
    assert_response :success
  end

  test "should get contact" do
    get public_static_pages_contact_url
    assert_response :success
  end

  test "should get how_to_register" do
    get public_static_pages_how_to_register_url
    assert_response :success
  end

  test "should get how_to_buy" do
    get public_static_pages_how_to_buy_url
    assert_response :success
  end

end
