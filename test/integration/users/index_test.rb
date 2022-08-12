require "test_helper"
require "integration/config.rb"

class UsersIndexTest < ActionDispatch::IntegrationTest 
  test 'index includeing pagination' do
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
      assert_select 'a[href=?]', user_path(user),
                                  method: :delete,
                                  text: 'delete'
    end
    assert_difference 'User.count', -1 do 
      delete user_path(users :shevchenko)
    end
  end
end
