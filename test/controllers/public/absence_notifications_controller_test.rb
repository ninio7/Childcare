require "test_helper"

class Public::AbsenceNotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_absence_notifications_new_url
    assert_response :success
  end

  test "should get index" do
    get public_absence_notifications_index_url
    assert_response :success
  end

  test "should get show" do
    get public_absence_notifications_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_absence_notifications_edit_url
    assert_response :success
  end
end
