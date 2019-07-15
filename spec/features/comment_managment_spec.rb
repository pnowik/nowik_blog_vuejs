require "rails_helper"

RSpec.describe "Comment Management", type: :feature do

  describe "POST comment#create" do
    it "should create new comment" do
      user = FactoryGirl.create(:user, :standard)
      login_as user
      post = FactoryGirl.create(:post)
      visit "posts/#{post.id}"
      page.should have_css('textarea#comment_body')

      fill_in "comment_body", with: "a" * 7

      expect { click_button "Submit" }.to change(Comment, :count).by(1)
    end

    it "should not create new comment" do
      user = FactoryGirl.create(:user, :admin)
      post = FactoryGirl.create(:post)
      visit "posts/#{post.id}"

      page.should_not have_css('textarea#comment_body')
    end
  end
end
