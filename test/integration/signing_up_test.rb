require "test_helper"

class SigningUpTest < ActionDispatch::IntegrationTest

  test "Sign up a new user" do
    get '/signup'
    assert_response :success

    post users_path,
      params: { 
        user: { 
          username: "phuongng2", 
          email: "phuongng2@example.com",
          password: "password123" 
        }
      }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end