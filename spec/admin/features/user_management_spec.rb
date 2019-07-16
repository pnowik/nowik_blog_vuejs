require "rails_helper"

RSpec.describe "Admin User Management", type: :feature do

  describe "GET admin/users#edit" do
    it "admin should edit user" do
      user = FactoryGirl.create(:user, :standard)
      admin = FactoryGirl.create(:user, :admin)
      login_as admin
      visit "admin/users/#{user.id}/edit"

      fill_in "user_name", with: "b" * 7
      fill_in "user_email", with: "test@test.com"

      click_button "Update"

      expect(user.reload.name).to eq "b" * 7
      expect(user.email).to eq "test@test.com"
    end

    it "mod should edit user" do
      user = FactoryGirl.create(:user, :standard)
      mod = FactoryGirl.create(:user, :mod)
      login_as mod
      visit "admin/users/#{user.id}/edit"

      fill_in "user_name", with: "b" * 7
      fill_in "user_email", with: "test@test.com"

      click_button "Update"

      expect(user.reload.name).to eq "b" * 7
      expect(user.email).to eq "test@test.com"
    end
  end
end

