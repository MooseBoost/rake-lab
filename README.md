# Rake Lab

## Objectives

1. Build a Rake task that interacts with the file structure of a project. 
2. Build Rake tasks that communicate with a database. 

## Overview

For this lab, we've provided you with a working `Course` class, that produces instances that represent courses offered at our fictitious school. We've also provided you with a seed file, in `db/seeds.rb`, that contains some code that will create and save some dummy data into the courses table of our database. Your job is simply to create a few Rake tasks that will interact with our program.  

## Instructions

1. In your Rakefile, build a Rake task, `create_file`. This task should have the following description: `"creates and writes to a new file called new_file.rb"`. This task should create a new file called `new_file.rb` in the top-level of this directory. This task should also write the following content to this file: `"This file is brought to you by Rake!"`. 
2. In your Rakefile, build a Rake task, `migrate`. This task should be namespaced under `db`. This task should use the `Course.create_table` method to create the courses table. This task should have a description. 
3. In your Rakefile, build a Rake task, `seed`. this task should be namespaced under `db`. This task should run the code in the `db/seeds.rb` file to seed your database with the dummy data oultined in that file. This task should have a description.
