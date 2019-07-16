require "rails_helper"

RSpec.describe 'layouts/_menu', type: :view do

  context 'admin logged in' do
    let(:user) {FactoryGirl.create(:user,:admin)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'should display link to admin panel' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts", :text => 'Admin Panel')
    end
  end

  context 'mod logged in' do
    let(:user) {FactoryGirl.create(:user,:mod)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'should display link to admin panel' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts", :text => 'Admin Panel')
    end
  end

  context 'user logged in' do
    let(:user) {FactoryGirl.create(:user,:standard)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'should not display link to admin panel' do
      render

      expect(rendered).to_not have_link(nil, href: "/admin/posts", :text => 'Admin Panel')
    end
  end

  context 'user not logged in' do
    it 'should not display link to admin panel' do
      render

      expect(rendered).to_not have_link(nil, href: "/admin/posts", :text => 'Admin Panel')
    end
  end
end