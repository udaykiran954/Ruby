# Ruby on Rails Internship Documentation

DAY 1 – ENVIRONMENT SETUP AND INTRODUCTION

On the first day of the internship, I completed all required software installations and wrote my first Ruby program.

Ruby Concepts Learned:
- Everything in Ruby is an object (methods are also objects)
- Ruby follows SOLID principles (the “I” in SOLID is silent)
- Ruby syntax is simple and highly readable

Rails Concepts Learned:
- Rails is a Ruby framework used to build dynamic web applications
- Rails follows the MVC (Model–View–Controller) architecture

Commands Practiced:
ruby -v  
gem install rails  
rails new ApplicationName  
rails s  
rails s -p portnumber  

--------------------------------------------------

DAY 2 – RAILS APPLICATION AND DATABASE SETUP

Learned how to create Rails applications with database configurations and scaffolding.

Rails Application with Database:
rails new applicationname -d databasetype  

Skip and JavaScript commands can be used as extensions in the rails new command.

Rails Console:
rails console  
rails c  

Database Commands:
rails db:create  
rails db:seed  
rails db:migrate  

Note: rails db:migrate is commonly used in production environments and may throw exceptions if misused.

Scaffold Generation:
rails generate scaffold Customer name:string email:string  

--------------------------------------------------

DAY 3 – RAILS ARCHITECTURE AND CONFIGURATION

Key Concepts:
- Syntactic Sugar
- Convention over Configuration

Rails Request Flow:
routes.rb  
Controller actions  
Model  
View  

Important Files and Directories:
- routes.rb: Defines application endpoints; deleting this file prevents the application from running
- bin: Auto-generated and non-modifiable
- config: Contains application configuration
  - environment: Used for replication and testing
  - initializers: Extendable and customizable
  - locales: Extendable

Other Important Files:
- rake
- boot.rb
- application.rb

--------------------------------------------------

DAY 4 – CONFIGURATION FILES AND ROUTING

Configuration Files:
- secrets.rb: Stores secured data
- credentials.yml: Used for different environments
- database.yml: SQL database configuration
- deploy.yml: Deployment instructions
- environment.rb: Mandatory file for application execution
- importmap.rb: Introduced after Rails 7
- puma.rb: Default Rails server

Routing Types:
- Member routes
- Collection routes
- Nested routes

--------------------------------------------------

DAY 5 – RUBY VARIABLES AND DATATYPES

Types of Variables in Ruby:
1. Global variables ($college_name = "IIIT")
2. Class variables (@@count = 0)
3. Instance variables (@name = "uday")
4. Local variables (a = 10)
5. Constants (PI = 3.14)

Datatypes:
Ruby is a dynamically typed language. Common datatypes include:
- Integer
- String
- Symbol
- Boolean
- Nil

Strings are mutable, while symbols are immutable.

Checking Datatype:
a.class  

User Input:
a = gets.chomp  
puts a  

Type Conversion Methods:
to_i  
to_s  
to_f  

--------------------------------------------------

DAY 6 – LOOPS AND ARRAY METHODS

Loops in Ruby:
- for loop
- while loop
- loop do
- until loop
- break
- next
- redo

Array Methods:
- select
- each
- reject
- all?
- any?
- map
- collect

Note: Methods with ! modify the original array.

--------------------------------------------------

DAY 7 – INHERITANCE AND OBJECT HIERARCHY

Inheritance in Ruby:
- Ruby supports only single-level inheritance
- Inheritance is represented using the < symbol

super Keyword:
- Used to call parent class methods

Object Hierarchy:
Child  
Base  
Object  
Kernel  
BasicObject  

Reflection Methods:
- ancestors
- respond_to?

--------------------------------------------------

DAY 8 – CONDITIONAL STATEMENTS AND ACCESS MODIFIERS

Conditional Statements:
- if–else
- elsif
- case
- ternary operator
- unless

Access Modifiers in Ruby:
- Public: Accessible everywhere
- Private: Accessible only within the class
- Protected: Accessible within the class and its subclasses

--------------------------------------------------

DAY 9 – RAILS VALIDATIONS AND SCOPES

Validations in Rails:
Validations can be implemented in two ways:
1. Through UI (triggered while entering data)
2. Through Model (triggered on form submission)

Model Validations:
- Format validation
- Numericality validation
- Length validation

Custom Validations:
Implemented using custom methods and the validate keyword.

Scopes:
- Used for repeated queries
- Supports method chaining

--------------------------------------------------

