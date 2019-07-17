require "rails_helper"

RSpec.describe 'posts/index.html.erb', type: :view do

  before :each do
    @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
    @post.save
    @comment = Comment.new(body: "comment", post_id: 1, user_id: 1)
    @comment.save
    @posts = Post.paginate(page: params[:page], per_page: 20)
  end

  it 'display post details correctly' do
    @user = User.new(name: "pnowik", email: "pnowik@gmail.com", password: "foobar", password_confirmation: "foobar")
    @user.save
    @post = Post.new(title: "a" * 5, subtitle: "b" * 30, body: "c" * 100, user_id: 1)
    @post.save
    render

    expect(rendered).to have_link(nil, href: "/posts/#{@post.id}", :text => 'a' * 5)
  end

  context 'admin logged in' do
    let(:user) {FactoryBot.create(:user,:admin)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'display link to new post' do
      render

      expect(rendered).to have_selector('a', :text => 'New Post')
    end
  end

  context 'mod logged in' do
    let(:user) {FactoryBot.create(:user,:mod)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'display link to new post' do
      render

      expect(rendered).to have_selector('a', :text => 'New Post')
    end
  end

  context 'user logged in' do
    let(:user) {FactoryBot.create(:user,:standard)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'should not display link to new post' do
      render

      expect(rendered).to_not have_selector('a', :text => 'New Post')
    end
  end

  context 'user not logged in' do

    it 'should not display link to new post' do
      render

      expect(rendered).to_not have_selector('a', :text => 'New Post')
    end
  end
end