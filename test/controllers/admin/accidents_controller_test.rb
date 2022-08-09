require "test_helper"

class Admin::AccidentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_accidents_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_accidents_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_accidents_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_accidents_edit_url
    assert_response :success
  end
end
