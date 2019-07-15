require "rails_helper"

RSpec.describe "User Management", type: :feature do

  describe "GET devise/registrations#new" do
    it "create new user" do
      visit "my/users/sign_up"

      fill_in "user_name", with: "a" * 7
      fill_in "user_email", with: "example@gmail.com"
      fill_in "user_password", with: "a" * 7
      fill_in "user_password_confirmation", with: "a" * 7

      expect { click_button "Sign up" }.to change(User, :count).by(1)
    end

  end


  describe "GET devise/registration#edit" do
    it "should edit user" do
      user = FactoryGirl.create(:user, :standard)
      login_as user
      visit "my/users/edit"

      fill_in "user_name", with: "b" * 7
      fill_in "user_email", with: "test@test.com"
      fill_in "user_current_password", with: "password"

      click_button "Update"

      expect(user.reload.name).to eq "b" * 7
      expect(user.email).to eq "test@test.com"
    end

    it "should not edit user" do
      user = FactoryGirl.create(:user, :standard)
      login_as user
      visit "my/users/edit"

      fill_in "user_name", with: "b" * 7
      fill_in "user_email", with: "test@test.com"
      fill_in "user_current_password", with: "passwordd"

      click_button "Update"

      expect(user.reload.name).to_not eq "b" * 7
      expect(user.email).to_not eq "test@test.com"
    end
  end
end

