class Blog

	attr_accessor :posts
	def initialize
		@posts = []
	end

	def add_post post

		@posts.push(post)

	end

	def latest_post
		retarray = @posts.sort {|x,y| y.date <=> x.date}
		retarray
	end
	
end

