require_relative "../config/environment.rb"

class Course

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  attr_accessor :name, :description
  attr_reader :id
  
  def initialize(name, description, id=nil)
    @id = id
    @name = name
    @description = description
  end
  
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS courses (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        description TEXT
        )
    SQL
    DB[:conn].execute(sql) 
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS courses"
    DB[:conn].execute(sql) 
  end
  
  def save
    sql = <<-SQL
      INSERT INTO courses (name, description) 
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.description)
    
  end

  def self.create(hash)
    name = hash[:name]
    description = hash[:description]
    course = Course.new(name, description)
    course.save
  end

  def self.all
    sql = "SELECT * FROM courses" 
    DB[:conn].execute(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM courses WHERE id = ?"
    DB[:conn].execute(sql, id)
  end

end
