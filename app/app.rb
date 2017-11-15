ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'models/link.rb'
require_relative 'models/tag.rb'

class BookmarkManager < Sinatra::Base

get '/' do
  # @link1 = BookmarkManager.get(1)
  erb(:index)
end

get '/links' do
  @links = Link.all
  erb(:links)
end

get '/links/new' do
  erb(:new)
end

post '/links' do
  new_link = Link.new(url: params[:url], title: params[:title])
  new_tag = Tag.new(name: params[:tag])
  new_link.tags << new_tag
  new_link.save
  redirect '/links'
end

run! if app_file == $0
end
