require "rails_helper"

RSpec.describe "Admin Post Management", type: :feature do

  describe "GET admin/posts#new" do
    it "should create admin new post" do
      user = FactoryBot.create(:user, :admin)
      login_as user
      visit "admin/posts/new"

      fill_in "post_title", with: "a" * 7
      fill_in "post_subtitle", with: "a" * 50
      fill_in "post_body", with: "a" * 300

      expect { click_button "Save" }.to change(Post, :count).by(1)
    end

    it "should create mod new post" do
      user = FactoryBot.create(:user, :mod)
      login_as user
      visit "admin/posts/new"

      fill_in "post_title", with: "a" * 7
      fill_in "post_subtitle", with: "a" * 50
      fill_in "post_body", with: "a" * 300

      expect { click_button "Save" }.to change(Post, :count).by(1)
    end
  end

  describe "GET admin/posts#edit" do
    it "should edit admin post" do
      user = FactoryBot.create(:user, :admin)
      login_as user
      post = FactoryBot.create(:post)
      visit "admin/posts/#{post.id}/edit"

      fill_in "post_title", with: "b" * 7
      fill_in "post_subtitle", with: "b" * 50
      fill_in "post_body", with: "b" * 300

      click_button "Save"

      expect(post.reload.title).to eq "b" * 7
      expect(post.subtitle).to eq "b" * 50
      expect(post.body).to eq "b" * 300
    end

    it "should edit mod post" do
      user = FactoryBot.create(:user, :mod)
      login_as user
      post = FactoryBot.create(:post)
      visit "admin/posts/#{post.id}/edit"

      fill_in "post_title", with: "b" * 7
      fill_in "post_subtitle", with: "b" * 50
      fill_in "post_body", with: "b" * 300

      click_button "Save"

      expect(post.reload.title).to eq "b" * 7
      expect(post.subtitle).to eq "b" * 50
      expect(post.body).to eq "b" * 300
    end
  end

  describe "DELETE admin/posts#destroy" do
    it "should delete admin post" do
      user = FactoryBot.create(:user, :admin)
      login_as user
      FactoryBot.create(:post)
      visit "/admin/posts/"

      expect { click_link "delete"}.to change(Post, :count).by(-1)
    end

    it "should delete mod post" do
      user = FactoryBot.create(:user, :mod)
      login_as user
      FactoryBot.create(:post)
      visit "/admin/posts/"

      expect { click_link "delete"}.to change(Post, :count).by(-1)
    end
  end
end
