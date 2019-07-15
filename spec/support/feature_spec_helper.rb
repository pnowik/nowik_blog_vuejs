module FeatureSpecHelper
  def login(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
  end
end