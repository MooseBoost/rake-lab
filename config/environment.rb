require 'sqlite3'
require 'pry'

require_relative "../lib/course.rb"

DB = {:conn => SQLite3::Database.new("db/courses.db")}