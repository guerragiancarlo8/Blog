require_relative '../lib/blog.rb'
require_relative '../lib/post.rb'

require 'rspec'

RSpec.describe 'Blog class' do
	before :each do
		@blog = Blog.new
		@post = Post.new("first","11 Aug 2010","sometext")
	end

	describe 'array of posts' do
		it 'ensures that an array of posts is returned' do
			expect(@blog.posts).to eq([])
		end
	end

	describe 'adding a post' do
		it 'ensures a post is correctly added to post array' do
			expect(@blog.add_post(@post)).to eq([@post])
			expect(@blog.posts.include? @post).to eq(true)
		end
	end

	describe '#latest_post' do
		it 'orders the posts by date, with newest first' do
			@postB = Post.new("This one should be first","12 Aug 2015","someText")
			@blog.add_post(@post)
			@blog.add_post(@postB)
			expect(@blog.latest_post).to eq([@postB,@post])
		end
	end


end

