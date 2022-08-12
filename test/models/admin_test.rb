require "test_helper"

class AdminTest < ActiveSupport::TestCase
  test 'should be an admin' do 
    user = users :admin
    assert user.admin?
  end

  test 'should delete user by admin' do 
    user = users :shevchenko
    assert_not user.admin?
  end
end
