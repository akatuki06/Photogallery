require 'test_helper'

class Admin::ExhibitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_exhibitions_index_url
    assert_response :success
  end

end
