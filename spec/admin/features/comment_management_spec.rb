require "rails_helper"

RSpec.describe "Admin Comment Management", type: :feature do

  describe "POST admin/comment#create" do
    it "should create new comment" do
      user = FactoryGirl.create(:user, :admin)
      post = FactoryGirl.create(:post)
      login_as user
      visit "/admin/posts/#{post.id}"
      page.should have_css('textarea#comment_body')

      fill_in "comment_body", with: "a" * 7

      expect { click_button "Submit" }.to change(Comment, :count).by(1)
    end

    it "should not create new comment" do
      user = FactoryGirl.create(:user, :admin)
      post = FactoryGirl.create(:post)
      visit "admin/posts/#{post.id}"

      page.should_not have_css('textarea#comment_body')
    end
  end

  describe "GET admin/comments#edit" do
    it "should edit admin comments" do
      user = FactoryGirl.create(:user, :admin)
      login_as user
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)

      visit edit_admin_post_comment_path(post.id, comment.id)
      fill_in "comment_body", with: "admin"
      click_button "Submit"
      expect(comment.reload.body).to eq "admin"
    end

    it "admin should edit mod comment" do
      mod = FactoryGirl.create(:user, :mod)
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user, :admin)
      login_as user
      visit edit_admin_post_comment_path(post.id, comment.id)

      fill_in "comment_body", with: "admin"

      click_button "Submit"

      expect(comment.reload.body).to eq "admin"
    end

    it "admin should publish and unpublish user comment" do
      standard = FactoryGirl.create(:user, :standard)
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user, :admin)
      login_as user
      visit "admin/posts/#{post.id}"

      click_button "Publish"

      expect(comment.reload.published).to eq true

      click_button "Unpublish"

      expect(comment.reload.published).to eq false
    end

    it "should edit mod comment" do
      user = FactoryGirl.create(:user, :mod)
      login_as user
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      visit edit_admin_post_comment_path(post.id, comment.id)

      fill_in "comment_body", with: "b" * 7

      click_button "Submit"

      expect(comment.reload.body).to eq "b" * 7
    end

    it "mod should edit admin comment" do
      admin = FactoryGirl.create(:user, :admin)
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user, :mod)
      login_as user
      visit edit_admin_post_comment_path(post.id, comment.id)

      fill_in "comment_body", with: "mod"

      click_button "Submit"

      expect(comment.reload.body).to eq "mod"
    end

    it "mod should edit user comment" do
      standard = FactoryGirl.create(:user, :standard)
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user, :mod)
      login_as user
      visit edit_admin_post_comment_path(post.id, comment.id)

      fill_in "comment_body", with: "mod"

      click_button "Submit"

      expect(comment.reload.body).to eq "mod"
    end
  end

  describe "DELETE admin/comments#destroy" do
    it "should delete admin comments" do
      user = FactoryGirl.create(:user, :admin)
      login_as user
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)

      visit admin_post_comments_path(post.id)

      expect { click_link "delete"}.to change(Comment, :count).by(-1)
    end

    it "admin should delete mod comments" do
      mod = FactoryGirl.create(:user, :mod)
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user, :admin)
      login_as user

      visit admin_post_comments_path(post.id)

      expect { click_link "delete"}.to change(Comment, :count).by(-1)
    end

    it "admin should delete user comments" do
      standard = FactoryGirl.create(:user, :standard)
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user, :admin)
      login_as user

      visit admin_post_comments_path(post.id)

      expect { click_link "delete"}.to change(Comment, :count).by(-1)
    end

    it "should delete mod comments" do
      user = FactoryGirl.create(:user, :mod)
      login_as user
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)

      visit admin_post_comments_path(post.id)

      expect { click_link "delete"}.to change(Comment, :count).by(-1)
    end

    it "mod should delete admin comments" do
      admin = FactoryGirl.create(:user, :admin)
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user, :mod)
      login_as user

      visit admin_post_comments_path(post.id)

      expect { click_link "delete"}.to change(Comment, :count).by(-1)
    end

    it "mod should delete user comments" do
      standard = FactoryGirl.create(:user, :standard)
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment)
      user = FactoryGirl.create(:user, :mod)
      login_as user

      visit admin_post_comments_path(post.id)

      expect { click_link "delete"}.to change(Comment, :count).by(-1)
    end
  end
end