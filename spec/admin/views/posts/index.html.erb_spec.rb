require "rails_helper"

RSpec.describe 'admin/posts/index.html.erb', type: :view do

  context 'admin logged in' do
    let(:user) {FactoryBot.create(:user,:admin)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    before :each do
      @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
      @comment.save
      @posts = Post.paginate(page: params[:page], per_page: 20)
    end

    it 'display post details correctly' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}", :text => 'a' * 5)
    end

    it 'display link to new post' do
      render

      expect(rendered).to have_selector('a', :text => 'new')
    end

    it 'display link to show post' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}", :text => 'show')
    end

    it 'display link to edit post' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}/edit", :text => 'edit')
    end

    it 'display link to comments' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}/comments", :text => 'comments')
    end
  end

  context 'mod logged in' do
    let(:user) {FactoryBot.create(:user,:mod)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    before :each do
      @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
      @post.save
      @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
      @comment.save
      @posts = Post.paginate(page: params[:page], per_page: 20)
    end

    it 'display post details correctly' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}", :text => 'a' * 5)
    end

    it 'display link to new post' do
      render

      expect(rendered).to have_selector('a', :text => 'new')
    end

    it 'display link to show post' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}", :text => 'show')
    end

    it 'display link to edit post' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}/edit", :text => 'edit')
    end

    it 'display link to comments' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}/comments", :text => 'comments')
    end
  end
end