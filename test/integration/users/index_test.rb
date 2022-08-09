require "test_helper"
require "helpers/integration_test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest 
  include IntegrationTestHelper
  test 'index includeing pagination' do
    log_in_as users :shevchenko

    get users_path
    assert_template 'users/index'
    assert_select 'nav.pagination'

    User.page(1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
end
