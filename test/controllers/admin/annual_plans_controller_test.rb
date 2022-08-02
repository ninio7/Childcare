require "test_helper"

class Admin::AnnualPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_annual_plans_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_annual_plans_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_annual_plans_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_annual_plans_edit_url
    assert_response :success
  end
end
