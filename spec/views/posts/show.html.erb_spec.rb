require "rails_helper"

RSpec.describe 'posts/show', type: :view do

  it 'display post details correctly' do
    @user = User.new(name: "pnowik", email: "pnowik@gmail.com", password: "foobar", password_confirmation: "foobar")
    @user.save
    @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
    @post.save
    render

    expect(rendered).to have_selector 'h1', :text => 'a' * 5
    expect(rendered).to have_selector 'h4', :text => 'b' * 30
    expect(rendered).to have_selector 'p', :text => 'c' * 100
  end

  context 'user logged in' do
    let(:user) {FactoryGirl.create(:user,:standard)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'display form to add comment' do

      @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
      @comment.save
      render

      expect(rendered).to have_selector 'h3', :text => 'Post a comment'
    end

    it 'not display link to edit post' do
      @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
      @comment.save
      render

      expect(rendered).to_not have_link(nil, href: "/posts/#{@post.id}/edit", :text => 'edit')
    end
  end

  context 'user not logged in' do

    it 'display text to sign in or sign up' do

      @user = User.new(name: "pnowik", email: "pnowik@gmail.com", password: "foobar", password_confirmation: "foobar")
      @user.save
      @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
      @comment.save
      render

      expect(rendered).to have_selector 'a[href="/my/users/sign_in"]', :text => 'Sign in'
      expect(rendered).to have_selector 'a[href="/my/users/sign_up"]', :text => 'Sign up'
    end

    it 'not display link to edit post' do
      @user = User.new(name: "pnowik", email: "pnowik@gmail.com", password: "foobar", password_confirmation: "foobar")
      @user.save
      @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
      @comment.save
      render

      expect(rendered).to_not have_link(nil, href: "/posts/#{@post.id}/edit", :text => 'edit')
    end
  end

  context 'admin logged in' do
    let(:user) {FactoryGirl.create(:user,:admin)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'display form to add comment' do

      @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
      @comment.save
      render

      expect(rendered).to have_selector 'h3', :text => 'Post a comment'
    end

    it 'display link to edit post' do
      @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
      @comment.save
      render

      expect(rendered).to have_link(nil, href: "/posts/#{@post.id}/edit", :text => 'edit')
    end
  end
end