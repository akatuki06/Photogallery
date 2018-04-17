require 'test_helper'

class Public::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_artists_index_url
    assert_response :success
  end

  test "should get show" do
    get public_artists_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_artists_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_artists_new_url
    assert_response :success
  end

end
