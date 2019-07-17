require "rails_helper"

RSpec.describe 'layouts/_menu', type: :view do

  context 'admin logged in' do
    let(:user) {FactoryBot.create(:user, :admin)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'should display link to admin panel' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts", :text => 'Admin Panel')
    end

    it 'should display link to blog panel' do
      render

      expect(rendered).to have_link(nil, href: "/", :text => 'Nowik Blog')
    end
  end

  context 'mod logged in' do
    let(:user) {FactoryBot.create(:user, :mod)}

    before do
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'should display link to admin panel' do
      render

      expect(rendered).to have_link(nil, href: "/admin/posts", :text => 'Admin Panel')
    end

    it 'should display link to blog panel' do
      render

      expect(rendered).to have_link(nil, href: "/", :text => 'Nowik Blog')
    end
  end
end