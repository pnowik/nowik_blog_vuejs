require "rails_helper"

RSpec.describe 'admin/posts/show', type: :view do
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
    end

    it 'display form to add comment' do
      render

      expect(rendered).to have_selector 'h3', :text => 'Post a comment'
    end

    it 'display link to edit post' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts/#{@post.id}/edit", :text => 'edit')
    end
  end
end