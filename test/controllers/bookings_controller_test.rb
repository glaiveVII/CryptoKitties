require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get bookings_show_url
    assert_response :success
  end

  test "should get create" do
    get bookings_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bookings_destroy_url
    assert_response :success
  end

end
