require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    User.create!(name:  "pablo",
                 email: "pnowik@gmail.com",
                 password:              "qwerty",
                 password_confirmation: "qwerty",
                 )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

end
