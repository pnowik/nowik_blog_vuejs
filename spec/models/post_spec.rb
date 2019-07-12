require 'rails_helper'

RSpec.describe Post, :type => :model do

  describe "Validations" do

    before :each do
      @user = User.new(name: "pnowik", email: "pnowik@gmail.com", password: "foobar", password_confirmation: "foobar")
      @user.save
      @post = Post.new(title: "a" * 5, subtitle: "a" * 30, body: "a" * 100, user_id: 1)
    end

    it "is valid with valid attributes" do
      expect(@post).to be_valid
    end

    it "user id should be present" do
      @post.user_id = nil
      expect(@post).to_not be_valid
    end

    it "title should be present" do
      @post.title = "   "
      expect(@post).to_not be_valid
    end

    it "title should be at least 5 characters" do
      @post.title = "a" * 4
      expect(@post).to_not be_valid
    end

    it "title should be at most 140 characters" do
      @post.title = "a" * 141
      expect(@post).to_not be_valid
    end

    it "subtitle should be present" do
      @post.subtitle = "   "
      expect(@post).to_not be_valid
    end

    it "subtitle should be at least 30 characters" do
      @post.subtitle = "a" * 29
      expect(@post).to_not be_valid
    end

    it "subtitle should be at most 300 characters" do
      @post.subtitle = "a" * 301
      expect(@post).to_not be_valid
    end

    it "body should be present" do
      @post.body = "   "
      expect(@post).to_not be_valid
    end

    it "body should be at least 100 characters" do
      @post.body = "a" * 99
      expect(@post).to_not be_valid
    end

    it "body should be at most 5000 characters" do
      @post.body = "a" * 5001
      expect(@post).to_not be_valid
    end

  end

  describe "Associations" do

    it { expect(Post.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(Post.reflect_on_association(:comments).macro).to eq(:has_many) }

  end

end