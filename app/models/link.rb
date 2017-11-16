require 'dm-postgres-adapter'
require 'data_mapper'
require_relative 'tag.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
class Link
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, Text

  has n, :tags, :through => Resource
end


DataMapper.finalize
DataMapper.auto_upgrade!
