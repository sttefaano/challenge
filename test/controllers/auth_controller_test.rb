require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
  end

  test "should authenticate user with valid password " do
    assert @user.authenticate("123ABc")
  end

  test "should not authenticate user with wrong password " do
    assert_not @user.authenticate("123abc")
  end
end
