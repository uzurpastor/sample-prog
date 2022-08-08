require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  params =  
    { 
      user: 
      {  
        name:                   "Username",
        email:                  "example@com",
        password:               "password",
        password_confirmation:  "password" 
      } 
    }

  test "should show error with invalid sign up information" do 
    get sign_path
    params[:user].merge! name: ""
    breaked_params = params                                          
    assert_no_difference 'User.count' do
      post users_path,  params: breaked_params
    end
    assert_template 'users/new'
    assert_template partial: 'shared/_error_messages'
  end


  test "should signup and show welcome text with valid sign up information" do 
    get sign_path
    assert_difference 'User.count' do
      post users_path,  params: params
    end
    signed_user = User.find_by_email(params[:user][:email])
    assert_routing "/users/#{signed_user.id}", 
      controller: "users", 
      action: "show", 
      id: "#{signed_user.id}"
    assert_equal "Welcome to my app!\nVerificate your email", flash[:success]
  end

end