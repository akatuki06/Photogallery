require 'test_helper'

class Admin::SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sales_index_url
    assert_response :success
  end

end
