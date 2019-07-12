require 'rails_helper'

RSpec.describe Post, :type => :model do

  describe "Validations" do
    before :each do
      @user = User.new(name: "pnowik", email: "pnowik@gmail.com", password: "foobar", password_confirmation: "foobar")
      @user.save
      @post = Post.new(title: "a" * 5, subtitle: "a" * 30, body: "a" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "a" * 5, user_id: 1, post_id: 1)
    end

    it "is valid with valid attributes" do
      expect(@comment).to be_valid
    end

    it "user id should be present" do
      @comment.user_id = nil
      expect(@comment).to_not be_valid
    end

    it "post id should be present" do
      @comment.post_id = nil
      expect(@comment).to_not be_valid
    end

    it "body should be present" do
      @comment.body = "   "
      expect(@comment).to_not be_valid
    end

    it "body should be at least 1 characters" do
      @comment.body = "a" * 0
      expect(@comment).to_not be_valid
    end

    it "body should be at most 400 characters" do
      @comment.body = "a" * 401
      expect(@comment).to_not be_valid
    end
  end

  describe "Associations" do

    it { expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to) }

  end

end