require_relative '../server.rb'

require 'rspec'

require 'rack/test'

describe 'Server Service' do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	it 'should load the home page' do
		get '/'
		expect(last_response).to be_ok
	end

	it 'should load the sorted home page' do
		get '/latest_posts'
		expect(last_response).to be_ok
	end

	it 'should rout to post info' do
		get '/post_details/1/1'
		expect(last_response).to be_ok
	end

	it 'routs to create link page' do
		get '/new_post'
		expect(last_response).to be_ok
	end

	it 'succesfully redirects to home page' do
		get '/'
		expect(last_response.redirect?).to be(true)
		follow_redirect!
		expect(last_request.path).to eq('/add_post')
	end
end