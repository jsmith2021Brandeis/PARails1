require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get subjects" do
    get static_pages_subjects_url
    assert_response :success
  end

  test "should get courses" do
    get static_pages_courses_url
    assert_response :success
  end

  test "should get instructors" do
    get static_pages_instructors_url
    assert_response :success
  end
end
