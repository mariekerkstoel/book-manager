require 'sinatra'
require 'dm-postgres-adapter'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/bookmark_manager_development')
# DataMapper.setup(:test, 'postgres://localhost/bookmark_manager_test')
DataMapper::Logger.new($stdout, :debug)
class Link
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, Text
end


DataMapper.finalize
DataMapper.auto_upgrade!
