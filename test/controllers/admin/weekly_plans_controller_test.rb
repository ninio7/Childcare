require "test_helper"

class Admin::WeeklyPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_weekly_plans_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_weekly_plans_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_weekly_plans_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_weekly_plans_edit_url
    assert_response :success
  end
end
