require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      name:                  'xxxx',
      email:                 "aaaa@ddd.dd",
      password:              "somepass",
      password_confirmation: "key4pass"
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
      # .shev.and@mail.com
      # ,shev.and@mail.com
      # shev.and@.mail.com
      # shev.and@,mail.com
      # shev.and.@mail.com
      # shev.and,@mail.com
    invalid_adresses.each do |invalid_adress| 
      @user.email = invalid_adress
      assert_not @user.valid?, "#{invalid_adress.inspect} should be invalid"
    end
  end

  test "email should be unique" do 
    duple_user = @user.dup    
    duple_user.email = @user.email.upcase
    @user.save
    assert_not duple_user.valid?
  end

  test "pass should have a minimum length" do 
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
  # test "email should be downcase" do 
  #   assert_not @user.valid?
  # end
end

# , # $ @ ) ( + - = ^ : ; * ! % № ` ~ / | \ ? > < ' "