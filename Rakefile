desc "creates and writes to a new file called new_file.rb"
task :create_file do
  File.open("new_file.rb", 'w') do |f|
    f.write("This file is brought to you by Rake!")
  end  
end

task :environment do
  require_relative './config/environment.rb'
end

desc "creates a table for the Course class"
namespace :db do
  task :migrate => :environment do
    Course.create_table
  end
  desc 'create dummy courses'
  task :seed do
    require_relative './db/seeds.rb'
  end
end
