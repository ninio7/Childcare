require "test_helper"

class Admin::ClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_classes_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_classes_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_classes_edit_url
    assert_response :success
  end
end
