require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#admin?' do
    assert_equal users(:user).admin?, false
    assert_equal users(:admin).admin?, true
  end
end
