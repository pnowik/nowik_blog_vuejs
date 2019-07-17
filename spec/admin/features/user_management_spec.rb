require "rails_helper"

RSpec.describe "Admin User Management", type: :feature do

  describe "GET admin/users#edit" do
    it "admin should edit user" do
      user = FactoryBot.create(:user, :standard)
      admin = FactoryBot.create(:user, :admin)
      login_as admin
      visit "admin/users/#{user.id}/edit"

      fill_in "user_name", with: "b" * 7
      fill_in "user_email", with: "test@test.com"

      click_button "Update"

      expect(user.reload.name).to eq "b" * 7
      expect(user.email).to eq "test@test.com"
    end

    it "mod should edit user" do
      user = FactoryBot.create(:user, :standard)
      mod = FactoryBot.create(:user, :mod)
      login_as mod
      visit "admin/users/#{user.id}/edit"

      fill_in "user_name", with: "b" * 7
      fill_in "user_email", with: "test@test.com"

      click_button "Update"

      expect(user.reload.name).to eq "b" * 7
      expect(user.email).to eq "test@test.com"
    end

    it "mod should not edit admin" do
      admin = FactoryBot.create(:user, :admin)
      mod = FactoryBot.create(:user, :mod)
      login_as mod
      visit "admin/users/#{admin.id}/edit"

      expect(page).to_not have_selector(:button, "Update")
    end
  end

  describe "DELETE admin/users#destroy" do
    it "should delete admin user" do
      user = FactoryBot.create(:user, :admin)
      login_as user
      visit "/admin/users/"

      expect { click_link "delete"}.to change(User, :count).by(-1)
    end

    it "should delete mod user" do
      user = FactoryBot.create(:user, :mod)
      login_as user
      visit "/admin/users/"

      expect { click_link "delete"}.to change(User, :count).by(-1)
    end
  end
end

