require 'test_helper'

class Public::SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_sales_index_url
    assert_response :success
  end

end
