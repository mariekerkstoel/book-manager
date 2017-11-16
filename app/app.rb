ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'models/link.rb'
require_relative 'models/tag.rb'

class BookmarkManager < Sinatra::Base

get '/' do
  redirect '/links'
end

get '/links' do
  @links = Link.all
  erb(:links)
end

get '/links/new' do
  erb(:new)
end

get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb(:tags)
end

get '/add_tags' do
  erb(:add_tags)
end

post '/add_tags' do
  tag = Tag.first_or_create(name: params[:tag])
  link = Link.last
  link.tags << tag
  link.save
  redirect '/add_tags'
end

post '/links' do
  new_link = Link.create(url: params[:url], title: params[:title])
  new_tag = Tag.first_or_create(name: params[:tag])
  new_link.tags << new_tag
  new_link.save
  redirect '/add_tags'
end

run! if app_file == $0
end
