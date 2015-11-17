require "spec_helper"
require 'pry'
describe "Rake tasks" do 

  before(:each) do 
    DB[:conn].execute("DROP TABLE IF EXISTS courses")
  end

  describe ":create_file" do 
    it "creates and writes to a new file called new_file.rb" do 
      `rake create_file`
      filepath = "./"
      expect(Dir.entries(filepath)).to include("new_file.rb")
      expect(File.read('./new_file.rb')).to eq("This file is brought to you by Rake!")
    end
  end

  describe ":migrate" do 
    it "creates a new database table" do 
      `rake db:migrate`
      expect(DB[:conn].execute("SELECT * FROM courses")).to eq([])
    end
  end

  describe ":seed" do 
    it "inserts some dummy data from the db/seeds.rb file into the database table" do 
      `rake db:migrate`
      `rake db:seed`
      expect(Course.all.length).to eq(5)
      expect(Course.find_by_id(1)).to eq([[1, "Learn Ruby Now!", "learn Ruby with this class"]])
    end
  end
end