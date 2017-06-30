require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test user", email: "test@examlpe.com", password: "test123", password_confirmation: "test123")
  end

  test "is it valid?" do
    assert @user.valid?
  end

  test "name present?" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "mail present?" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name length" do
    @user.name = "a" * 51
  end

  test "email length" do
    @user.email = "a" * 244 + "@example.com"
  end

  test "valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "invalid email addresses" do
    invalid_addresses = %w[user@example,com USER@foo..COM A_US-ER.foo.org
                         first.last@foo_foo.jp alice+bob@baz+taz.cn]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "unique email address" do
    user_clone = @user.dup
    user_clone.email = @user.email.upcase
    @user.save
    assert_not user_clone.valid?
  end

  test "password not blank" do
    @user.password = @user.password_confirmation = " " * 7
    assert_not @user.valid?
  end

  test "password minimal length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
