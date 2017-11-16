require 'dm-postgres-adapter'
require 'data_mapper'

require_relative 'link.rb'
require_relative 'tag.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

DataMapper::Logger.new($stdout, :debug)

DataMapper.finalize

DataMapper.auto_upgrade!
