require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do

  context 'User not logged' do

    describe "GET admin/users#index" do
      it "index action should be failure" do
        get :index
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/users#show" do
      it "show action should be failure" do
        user = FactoryBot.create(:user, :standard)
        get :show, params: {id:user.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/users#edit" do
      it "edit action should be failure" do
        user = FactoryBot.create(:user, :standard)
        get :edit, params: {id:user.id}
        expect(response).to_not have_http_status(:success)
      end
    end

  end

  context 'User logged in as standard user' do
    let(:user) {FactoryBot.create(:user, :standard)}

    before do
      sign_in user
    end

    describe "GET admin/users#index" do
      it "index action should be failure" do
        get :index
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/users#show" do
      it "show action should be failure" do
        get :show, params: {id:user.id}
        expect(response).to_not have_http_status(:success)
      end
    end

    describe "GET admin/users#edit" do
      it "edit action should be failure" do
        get :edit, params: {id:user.id}
        expect(response).to_not have_http_status(:success)
      end
    end

  end

  context 'User logged in as mod' do
    let(:user) {FactoryBot.create(:user, :mod)}

    before do
      sign_in user
    end

    describe "GET admin/users#index" do
      it "index action should be success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/users#show" do
      it "show action should be success" do
        get :show, params: {id:user.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/users#edit" do
      it "edit action should be success" do
        get :edit, params: {id:user.id}
        expect(response).to have_http_status(:success)
      end
    end

  end

  context 'User logged in as admin' do
    let(:user) {FactoryBot.create(:user, :admin)}

    before do
      sign_in user
    end

    describe "GET admin/users#index" do
      it "index action should be success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/users#show" do
      it "show action should be success" do
        get :show, params: {id:user.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET admin/users#edit" do
      it "edit action should be success" do
        get :edit, params: {id:user.id}
        expect(response).to have_http_status(:success)
      end
    end
  end

end