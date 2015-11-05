require './lib/post.rb'
require './lib/blog.rb'
require 'date'
require 'sinatra'
require 'rspec'

blog = Blog.new
blog.add_post Post.new("Mi primer post",'11 Aug 2010',"El primer post!","miscelaneo","Giancarlo M. Guerra")
blog.add_post Post.new("Mi segunto post",'12 Aug 2010',"Y este es el segundo","random","Juanito Matapuerco")
blog.add_post Post.new("Mi tercer post",'13 Aug 2010',"A por el tercero :)","política","Sancho Panza")

get '/' do
	@posts = blog.posts
	erb(:home)
end

get '/latest_posts' do
	@posts = blog.latest_post
	erb(:latest_posts)

end

get '/post_details/:index/:page' do
	if params['page'] == "1"
		@post = blog.posts[(params['index']).to_i]
	elsif params['page'] == "2"
		ordered_blog = blog.latest_post
		@post = ordered_blog[(params['index']).to_i]
	end
	puts params['index']
	erb(:post_info)
end

get '/new_post' do
	erb(:new_post)
end

post '/add_post' do
	@title = params['title']
	@text = params['content']
	@category = params['category']
	@author = params['author']
	#puts Date.new.strftime('%d %b %Y')
	blog.add_post(Post.new(@title,Date.new.strftime('%d %b %Y'),@text,@category,@author))

	redirect('/')
end
