require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    user = users(:shevchenko)
    @post = user.posts.create content: "Lorem ipsum"
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "content should be at most 255 characters" do
    @post.content = "a" * 256
    assert_not @post.valid?
  end
  test "content should be larger then 5 characters" do
    @post.content = "a" * 4
    assert_not @post.valid?
  end
  test "order should be most recent first" do
    # debugger
    assert_equal @post, Post.first
  end
end
