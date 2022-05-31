require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | Ruby"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Ruby"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Ruby"
  end
  
  test "should get contact" do 
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Ruby"
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
