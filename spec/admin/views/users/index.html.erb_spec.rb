require "rails_helper"

RSpec.describe 'admin/users/index.html.erb', type: :view do

  before :each do
    @user = User.new(name: "testuser", email: "test@example.com", password: "password")
    @user.save
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  context 'admin logged in' do
    let(:user) {FactoryBot.create(:user, :admin)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'display link to show user' do
      render

      expect(rendered).to have_link(nil, href: "/admin/users/#{@user.id}", :text => 'show')
    end

    it 'display link to edit user' do
      render

      expect(rendered).to have_link(nil, href: "/admin/users/#{@user.id}/edit", :text => 'edit')
    end
  end

  context 'mod logged in' do
    let(:user) {FactoryBot.create(:user, :mod)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'display link to show user' do
      render

      expect(rendered).to have_link(nil, href: "/admin/users/#{@user.id}", :text => 'show')
    end

    it 'display link to edit user' do
      render

      expect(rendered).to have_link(nil, href: "/admin/users/#{@user.id}/edit", :text => 'edit')
    end

    it 'should not display link to edit admin user' do
      @user = User.new(name: "testuser", email: "test@example.com", password: "password", role: "admin")
      @user.save
      @users = User.paginate(page: params[:page], per_page: 20)
      render

      expect(rendered).to_not have_link(nil, href: "/admin/users/#{@user.id}/edit", :text => 'edit')
    end
  end
end
