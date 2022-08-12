require "test_helper"
require "integration/config.rb"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:shevchenko)
  end

  test "uncorrect edit " do 
    log_in_as @user
    get edit_user_path(@user)
    assert_template 'users/edit'    
    assert flash.empty?

    params_with_invalid_email = 
      { 
        user: 
        { 
          name: 'username',
          email: 'emailmail.net',
          password: 'passwd',
          password_confirmation: 'passwd' 
        } 
      }


      patch user_path(@user), params: params_with_invalid_email

    assert flash.empty?
    assert_template 'users/edit'
  end

  test 'correct edit' do 
    log_in_as @user
    get edit_user_path(@user)
    assert_template 'users/edit'    
    assert flash.empty?

    user_before_edit = @user
    json = data_as_hash_from @user, :id, :name, :email
    json[:user].merge! name: "Oleg"

      patch user_path(@user), params: json
    
    assert_redirected_to @user
    follow_redirect!

    assert_template 'users/show'
    assert_equal "Profile upload!", flash[:success]
    
    @user.reload
    assert_equal json[:user][:name], @user.name
  end

  test "success frendly redirect to edit page" do 

    get edit_user_path @user
    assert_redirected_to login_path
    log_in_as @user
    assert_redirected_to edit_user_path(@user)
  end
end
