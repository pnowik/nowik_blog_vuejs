require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "Validations" do

    before :each do
      @user = User.new(name: "pnowik", email: "pnowik@gmail.com", password: "foobar", password_confirmation: "foobar")
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is not valid without a name" do
      @user.name = "   "
      expect(@user).to_not be_valid
    end

    it "name should not be too long" do
      @user.name = "a" * 31
      expect(@user).to_not be_valid
    end

    it "name should be unique" do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).to_not be_valid
    end

    it "is not valid without a email" do
      @user.email = "   "
      expect(@user).to_not be_valid
    end

    it "emails should be unique" do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).to_not be_valid
    end

    it "email should not be too long" do
      @user.email = "a" * 50 + "@example.com"
      expect(@user).to_not be_valid
    end

    it "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
      end
    end

    it "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com, foo@bar..com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid, "#{invalid_address.inspect} should be invalid"
      end
    end

    it "password should be present (nonblank)" do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).to_not be_valid
    end

    it "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).to_not be_valid
    end

    it "password should have a maximum length" do
      @user.password = @user.password_confirmation = "a" * 129
      expect(@user).to_not be_valid
    end

  end

  describe "Associations" do

    it { expect(User.reflect_on_association(:posts).macro).to eq(:has_many) }
    it { expect(User.reflect_on_association(:comments).macro).to eq(:has_many) }

  end

end