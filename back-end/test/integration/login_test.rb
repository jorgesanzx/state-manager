require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'Requires correct credentials' do
    post user_token_url, params: { auth: { email: 'john@doe.com', password: 'password' } }

    assert_response :not_found
  end

  test 'Login as regular user' do
    user = users(:user)
    post user_token_url, params: { auth: { email: user.email, password: 'userpassword' } }

    assert_response :created
  end

  test 'Login as admin' do
    admin = users(:admin)
    post user_token_url, params: { auth: { email: admin.email, password: 'adminpassword' } }

    assert_response :created
  end
end
