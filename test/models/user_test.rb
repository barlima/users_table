require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should create valid user" do
    user = User.new(first_name: 'Adam', last_name: 'Williams', email: 'adamwilliams@example.com')
    assert user.valid?
  end

  test "should not create invalid user names" do
    user = User.new(first_name: '', last_name: '', email: 'adamwilliams@example.com')
    assert_not user.valid?
  end

  test "should not create invalid user email" do
    user = User.new(first_name: 'Adam', last_name: 'Williams', email: 'aaa')
    assert_not user.valid?
  end

end
