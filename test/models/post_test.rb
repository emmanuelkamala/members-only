require 'test_helper'

class PostTest < ActiveSupport::TestCase

	def setup
		@user = users(:braxton)
		@post = @user.posts.build(title: "My post",
															body: "This is a very short post")
	end

	test "post should be valid" do
		assert @post.valid?
	end

	test "title should be present" do
		@post.title = ""
		assert_not @post.valid?
	end	

	test "body should be present" do
		@post.body = ""
		assert_not @post.valid?
	end

	test "title should not be too long" do
		@post.title = "Walnut" * 50
		assert_not @post.valid?
	end

	test "body should not be too long" do
		@post.body = "a" * 2001
		assert_not @post.valid?
	end

	test "post should have a user_id" do
		@post.user_id = ""
		assert_not @post.valid?
	end
end
