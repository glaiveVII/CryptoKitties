require 'test_helper'

class KittiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kitties_index_url
    assert_response :success
  end

  test "should get show" do
    get kitties_show_url
    assert_response :success
  end

  test "should get create" do
    get kitties_create_url
    assert_response :success
  end

  test "should get update" do
    get kitties_update_url
    assert_response :success
  end

  test "should get edit" do
    get kitties_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get kitties_destroy_url
    assert_response :success
  end

  test "should get new" do
    get kitties_new_url
    assert_response :success
  end

end
