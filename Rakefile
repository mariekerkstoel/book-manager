require 'data_mapper'

namespace :db do
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (no data loss)"
  end
end
