module IntegrationTestHelper
  def log_in_as(user, options = {})

    session = 
      {
        email:       options[:email]        || user.email           || 'some_email@test.net',
        password:    options[:password]     || 'passwd'             || 'password',
        remember_me: options[:remember_me]  || user.remember_digest || '1'
      }

    post login_path, params: { session: session }
  end  

  def data_as_hash_from object, *options
    hash = { user: {} }
    options.each {|k| hash[:user][k] = object.send(k) }
    hash
  end
end