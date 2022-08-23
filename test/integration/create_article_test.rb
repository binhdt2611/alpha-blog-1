require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com",
                              password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  test "Create an article" do
    get '/articles/new'
    assert_response :success

    post articles_path,
      params: { 
        article: { 
          title: "Article Integration", 
          description: "Testing Integration for create article"
        }
      }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "Article Integration", response.body
  end
  
end