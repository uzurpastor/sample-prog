require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      name:                  'User',
      email:                 "valid.example@mail.com",
      password:              "somepass",
      password_confirmation: "somepass"
    )
  end

  test "should be valid" do 
    assert @user.valid?    
  end

  test "name should be to present"do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be to present"do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name need to be shortly then 50 symbols" do 
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email need to be shortly then 250 symbols" do
    @user.email = 'a' * 251
    assert_not @user.valid?
  end

  test "email validatiln should be reject invalid adress" do 
    invalid_adresses = %w[
      shev.and.com 
      shev.and@mail..com
      shev.and@mail.com.
      shev.and@mail.com,
      shev.and@mail,com
      shean,d@mail.com
      shean\d@mail.com
      shean#d@mail.com
      shean$d@mail.com
      shean@d@mail.com
      shean)d@mail.com
      shean-d@mail.com
      shean+d@mail.com
      shean(d@mail.com
      shean=d@mail.com
      shean^d@mail.com
      shean:d@mail.com
      shean;d@mail.com
      shean*d@mail.com
      shean!d@mail.com
      shean%d@mail.com
      shean№d@mail.com
      shean`d@mail.com
      shean~d@mail.com
      shean/d@mail.com
      shean|d@mail.com
      shean?d@mail.com
      shean>d@mail.com
      shean<d@mail.com
      shean'd@mail.com
      shean"d@mail.com
      sheand@
    ]
    invalid_adresses.each do |invalid_adress| 
      @user.email = invalid_adress
      assert_not @user.valid?, "#{invalid_adress.inspect} should be invalid"
    end
  end

  test "email should be unique" do 
    duple_user = @user.dup    
    duple_user.email 
    @user.save
    assert_not duple_user.valid?
  end

  test "pass should have a minimum length" do 
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test "email should be downcase" do 
    @user.email = text = "sOmeText@mail.dd"
    @user.save
    assert_equal text.downcase, @user.reload.email
  end

  test "name should be capitalize" do 
    @user.name = name_t = "usernaMe"    
    @user.save
    assert_equal name_t.capitalize, @user.reload.name
  end

  test "should create record in model EmailActivation with user_id as id user" do
    @user.save
    email_activation_record = EmailActivation.find_by(user_id: @user.id)
    assert email_activation_record.present?
  end
end

