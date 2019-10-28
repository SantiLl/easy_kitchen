require 'test_helper'

class KitchensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kitchens_index_url
    assert_response :success
  end

  test "should get show" do
    get kitchens_show_url
    assert_response :success
  end

  test "should get new" do
    get kitchens_new_url
    assert_response :success
  end

  test "should get create" do
    get kitchens_create_url
    assert_response :success
  end

end
