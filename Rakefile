task :environment do
  require_relative './config/environment'
end

desc "creates and writes to a new file called new_file.rb"
task :create_file do 
  system 'touch new_file.rb'
  File.open('new_file.rb', 'w') { |file| file.write("This file is brought to you by Rake!") }
end


namespace :db do 
  desc 'migrate changes to your database' 
  task :migrate => :environment do 
    Course.create_table
  end

  desc 'seed the database with some dummy data'
  task :seed do 
    require_relative './db/seeds.rb'
  end
end
