require "rails_helper"

RSpec.describe Admin::CommentsController, type: :controller do

  context 'User not logged' do

    describe "GET admin/comments#index" do
      it "index action should be failure" do
        FactoryBot.create(:user, :standard)
        post = FactoryBot.create(:post)
        get :index, params: {post_id: post.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/comments#show" do
      it "show action should be failure" do
        FactoryBot.create(:user, :standard)
        post = FactoryBot.create(:post)
        comment = FactoryBot.create(:comment)
        get :show, params: {post_id: post.id, id:comment.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/comments#new" do
      it "new action should be failure" do
        FactoryBot.create(:user, :standard)
        post = FactoryBot.create(:post)
        get :new, params: {post_id: post.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/comments#edit" do
      it "edit action should be failure" do
        FactoryBot.create(:user, :standard)
        post = FactoryBot.create(:post)
        comment = FactoryBot.create(:comment)
        get :edit, params: {post_id: post.id, id:comment.id}
        expect(response).to_not have_http_status(:success)
      end
    end

  end

  context 'User logged in as standard user' do
    let(:user) {FactoryBot.create(:user, :standard)}

    before do
      sign_in user
    end

    describe "GET admin/comments#index" do
      it "index action should be failure" do
        post = FactoryBot.create(:post)
        get :index, params: {post_id: post.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/comments#show" do
      it "show action should be failure" do
        post = FactoryBot.create(:post)
        comment = FactoryBot.create(:comment)
        get :show, params: {post_id: post.id, id:comment.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/comments#new" do
      it "new action should be failure" do
        post = FactoryBot.create(:post)
        get :new, params: {post_id: post.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/comments#edit" do
      it "edit action should be failure" do
        post = FactoryBot.create(:post)
        comment = FactoryBot.create(:comment)
        get :edit, params: {post_id: post.id, id:comment.id}
        expect(response).to_not have_http_status(:success)
      end
    end

  end

  context 'User logged in as mod' do
    let(:user) {FactoryBot.create(:user, :mod)}

    before do
      sign_in user
    end

    describe "GET admin/comments#index" do
      it "index action should be success" do
        post = FactoryBot.create(:post)
        get :index, params: {post_id: post.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/comments#show" do
      it "show action should be success" do
        post = FactoryBot.create(:post)
        comment = FactoryBot.create(:comment)
        get :show, params: {post_id: post.id, id:comment.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/comments#new" do
      it "new action should be success" do
        post = FactoryBot.create(:post)
        get :new, params: {post_id: post.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/comments#edit" do
      it "edit action should be success" do
        post = FactoryBot.create(:post)
        comment = FactoryBot.create(:comment)
        get :edit, params: {post_id: post.id, id:comment.id}
        expect(response).to have_http_status(:success)
      end
    end

  end

  context 'User logged in as admin' do
    let(:user) {FactoryBot.create(:user, :admin)}

    before do
      sign_in user
    end

    describe "GET admin/comments#index" do
      it "index action should be success" do
        post = FactoryBot.create(:post)
        get :index, params: {post_id: post.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/comments#show" do
      it "show action should be success" do
        post = FactoryBot.create(:post)
        comment = FactoryBot.create(:comment)
        get :show, params: {post_id: post.id, id:comment.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/comments#new" do
      it "new action should be success" do
        post = FactoryBot.create(:post)
        get :new, params: {post_id: post.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/comments#edit" do
      it "edit action should be success" do
        post = FactoryBot.create(:post)
        comment = FactoryBot.create(:comment)
        get :edit, params: {post_id: post.id, id:comment.id}
        expect(response).to have_http_status(:success)
      end
    end
  end

end