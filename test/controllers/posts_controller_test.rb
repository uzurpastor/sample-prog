require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    # @user = users :shevchenko
    @post = posts :post_1
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      process :post, '/posts', params: { post: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      process :delete, "/posts/#{@post.id}", params: { id: @post } 
    end
    assert_redirected_to login_url
  end
end
