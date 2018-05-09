require 'test_helper'

class Public::ClipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_clips_index_url
    assert_response :success
  end

end
