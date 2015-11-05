require_relative '../lib/post.rb'

RSpec.describe 'Post class' do
	before :each do
		@post = Post.new("My Title",Time.new.inspect,"The first blog post","scifi","R.L. Stine")
	end

	describe 'attributes' do
		it 'All attributes of a Post are correctly returned' do
			expect(@post.title).to eq("My Title")
			expect(@post.date).to eq(Time.new.inspect)
			expect(@post.text).to eq("The first blog post")
			expect(@post.category).to eq("scifi")
			expect(@post.author).to eq("R.L. Stine")
		end
	end
end