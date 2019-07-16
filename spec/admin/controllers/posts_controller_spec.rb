require "rails_helper"

RSpec.describe Admin::PostsController, type: :controller do

  context 'User not logged' do

    describe "GET admin/posts#index" do
      it "index action should be failure" do
        get :index
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/posts#show" do
      it "show action should be failure" do
        FactoryGirl.create(:user,:standard)
        post = FactoryGirl.create(:post)
        get :show, params: {id:post.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/posts#new" do
      it "new action should be failure" do
        get :new
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/posts#edit" do
      it "edit action should be failure" do
        FactoryGirl.create(:user,:standard)
        post = FactoryGirl.create(:post)
        get :edit, params: {id:post.id}
        expect(response).to_not have_http_status(:success)
      end
    end

  end

  context 'User logged in as standard user' do
    let(:user) {FactoryGirl.create(:user,:standard)}

    before do
      sign_in user
    end

    describe "GET admin/posts#index" do
      it "index action should be failure" do
        get :index
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/posts#show" do
      it "show action should be failure" do
        post = FactoryGirl.create(:post)
        get :show, params: {id:post.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/posts#new" do
      it "new action should be failure" do
        get :new
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/posts#edit" do
      it "edit action should be failure" do
        post = FactoryGirl.create(:post)
        get :edit, params: {id:post.id}
        expect(response).to_not have_http_status(:success)
      end
    end

  end

  context 'User logged in as mod' do
    let(:user) {FactoryGirl.create(:user,:mod)}

    before do
      sign_in user
    end

    describe "GET admin/posts#index" do
      it "index action should be success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/posts#show" do
      it "show action should be success" do
        post = FactoryGirl.create(:post)
        get :show, params: {id:post.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/posts#new" do
      it "new action should be success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/posts#edit" do
      it "edit action should be success" do
        post = FactoryGirl.create(:post)
        get :edit, params: {id:post.id}
        expect(response).to have_http_status(:success)
      end
    end

  end

  context 'User logged in as admin' do
    let(:user) {FactoryGirl.create(:user,:admin)}

    before do
      sign_in user
    end

    describe "GET admin/posts#index" do
      it "index action should be success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/posts#show" do
      it "show action should be success" do
        post = FactoryGirl.create(:post)
        get :show, params: {id:post.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/posts#new" do
      it "new action should be success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/posts#edit" do
      it "edit action should be success" do
        post = FactoryGirl.create(:post)
        get :edit, params: {id:post.id}
        expect(response).to have_http_status(:success)
      end
    end
  end

end