require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @user = users(:witek)
    @article = @user.articles.build(content: "Lorem ipsum dolor sit amet")
  end

  test "is valid?" do
    assert @article.valid?
  end

  test "user id present" do
    @article.user_id = nil
    assert_not @article.valid?
  end

  test "is content present?" do
    @article.content = "   "
    assert_not @article.valid?
  end
end
