require "test_helper"
require "integration/config.rb"

class UsersIndexTest < ActionDispatch::IntegrationTest 
  test 'index including pagination' do
    log_in_as users :shevchenko

    get users_path
    assert_template 'users/index'
    assert_select 'nav.pagination'

    User.page(1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
    assert_select 'a', text: 'delete', count: 0
  end

  test 'show delete butt when user is admin' do 
    log_in_as users :admin
    get users_path
    assert_template 'users/index'
    assert_select 'nav.pagination'

    User.page(1).each do |user|
      assert_select 'a[href=?]', user_path(user), 
                                  text: user.name
      assert_select 'a[href=?]', destroy_user_path(user),
                                  text: 'delete'
    end
    assert_difference 'User.count', -1 do 
      delete user_path(users :shevchenko)
    end
  end
  test 'should view avatar' do
    log_in_as users :shevchenko
    get users_path
    User.page(1).each do |user|
      assert_select 'img[src=?]', '/assets/user-icon-9b6be20f75f7fd16f724df3f9565bae9354a63aad3417fb9d38372c4ac3fbb98.jpg'
    end

  end
end
