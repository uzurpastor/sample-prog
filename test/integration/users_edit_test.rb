require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:shevchenko)
  end

  test "uncorrect edit " do 
    log_in_as @user

    get edit_user_path(@user)
    assert_template 'users/edit'    
    assert flash.empty?
    patch user_path(@user), params: { user: { name: '',
                                              email: 'invalid',
                                              password: 'passwd1',
                                              password_confirmation: 'passwd2' } }
    assert_template 'users/edit'
    assert flash.empty?
    
  end

  test 'correct edit' do 
    log_in_as @user

    name = @user.name
    email = @user.email 

    get edit_user_path(@user)
    assert_template 'users/edit'    
    assert flash.empty?
    patch user_path(@user), params: { user: { name: 'Oleg',
                                              email: 'valid.email@mail.net',
                                              password: 'passwd',
                                              password_confirmation: 'passwd' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_equal "Profile upload!", flash[:success]
    should_right_edit(name: name, email: email)
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "success frendly redirect to edit page" do 

    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)

  end


end
