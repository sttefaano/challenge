require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "should save new user with valid username and password" do
    user = User.new(username: "user", password: "123ABc", password_confirmation: "123ABc")
    assert user.save
  end

  test "should not save new user without username" do
    user = User.new(password: "123ABc", password_confirmation: "123ABc")
    assert_not user.save
  end

  test "should not save new user with invalid password" do
    user = User.new(username: "user", password: "123abc", password_confirmation: "123abc")
    assert_not user.save
  end

  test "should not save new user without password_confirmation" do
    user = User.new(username: "user", password: "123ABc")
    assert_not user.save
  end

  test "should not save new user with different passwords" do
    user = User.new(username: "user", password: "123ABc", password_confirmation: "123Abc")
    assert_not user.save
  end

  test "should not save new user with an existing username " do
    user = User.new(username: "user2", password: "123ABc", password_confirmation: "123Abc")
    assert_not user.save
  end
end
