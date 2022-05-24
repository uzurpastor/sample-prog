require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "home | ruby"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "help | ruby"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "about | ruby"
  end
  
  test "should get contact" do 
    get contact_url
    assert_response :success
    assert_select "title", "contact | ruby"
  end

  test "layout links" do 
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", sign_path

  end
end
