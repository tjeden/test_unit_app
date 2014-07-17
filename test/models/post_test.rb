require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post should have a title" do
    post = Post.new
    assert_equal false, post.save, "Saved without title"
  end
end
