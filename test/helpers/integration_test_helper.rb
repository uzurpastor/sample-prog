module IntegrationTestHelper
  def log_in_as(user, options = {})

    session = if user == users(:shevchenko)
      {
        email:       user.email,
        password:    'passwd',
        remember_me: user.remember_digest
      }
    else
      {
        email:        options[:email]       || 'some_email@test.net',
        password:     options[:password]    || 'password',
        remember_me:  options[:remember_me] || '1'
      }
    end

    post login_path, params: { session: session }
  end  

  def data_as_hash_from object, *options
    hash = { user: {} }
    options.each {|k| hash[:user][k] = object.send(k) }
    hash
  end
end