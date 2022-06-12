require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links is not Login" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path,count: 1
    assert_select "a[href=?]", about_path,count: 2
    assert_select "a[href=?]", contact_path,count: 2
    assert_select "a[href=?]", signup_path,count:1
    assert_select "a[href=?]",login_path,count:1
    get signup_path
    assert_select "title", full_title("Sign up")
    get contact_path
    assert_select "title", full_title("Contact")
  end

  def setup
    @user = users(:michael)
  end

  test "layout links isLogin " do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", users_path,count:1
    assert_select "a[href=?]",edit_user_path(@user),count:1
    assert_select "a[href=?]",logout_path,count:1
  end
end
