require 'test_helper'

class TextsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get texts_new_url
    assert_response :success
  end

  test "should get index" do
    get texts_index_url
    assert_response :success
  end

  test "should get show" do
    get texts_show_url
    assert_response :success
  end

  test "should get edit" do
    get texts_edit_url
    assert_response :success
  end

end
