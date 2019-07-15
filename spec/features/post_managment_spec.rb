require "rails_helper"

describe "Creating new post" do

  it "creates new user" do
    visit "my/users/sign_up"

    fill_in "user_name", with: "a" * 7
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "a" * 7
    fill_in "user_password_confirmation", with: "a" * 7
    expect { click_button "Sign up" }.to change(User, :count).by(1)
  end
  end
