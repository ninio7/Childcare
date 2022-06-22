require "test_helper"

class Admin::NewsesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_newses_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_newses_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_newses_index_url
    assert_response :success
  end
end
