# Day21
# Practice Questions
1. Write Ruby code to store a user’s name and age, and print a sentence using string interpolation.

```ruby
class User
    def add
        puts "Enter the name:"
        @name = gets.chomp
        puts "Enter the age:"
        @age = gets.chomp.to_i
    end
    def demonstrate
        puts "Name:#{@name}\nAge:#{@age}"
    end
end
user1 = User.new
user1.add
user1.demonstrate
```
- output:
```bash
Enter the name:
uday
Enter the age:
20
Name:uday
Age:20
```
2. Write Ruby code to take user input for age using gets, remove the newline, convert it to an integer, and print the age after 5 years.

```ruby
class Age
    def age
        puts "Enter the age";
        @age = gets.chomp.to_i
        @age
    end
    def after_five
        puts "after the five years age is #{@age.to_i + 5}";
    end
end
a = Age.new
a.age
a.after_five
```
- output:
```bash
Enter the age
20
after the five years age is 25
```

3. Write Ruby code that prints the numbers 1 2 3 on the same line, and then prints the same numbers on separate lines.
```ruby
class Array_print
    @@arr = [1,2,3]
    def printvertical
        for i in @@arr
            puts i
        end
    end
    def print_oneline
        for i in @@arr
           print "#{i} "
        end
        puts
    end
end
a1 = Array_print.new
a1.print_oneline
a1.printvertical
```
- output:
```bash
1 2 3 
1
2
3
```
4. What will be the output of the following Ruby code?
```ruby
name = "rails"
puts name.capitalize
```
- output:
```bash
Rails
```
5. Write Ruby code to iterate over the array [10, 20, 30] and print each value.
```ruby
[10,20,30].each do |e|
    print "#{e} "
end
```
- output:
```bash
10 20 30
```
6. Write Ruby code to convert the array [1, 2, 3, 4] into [2, 4, 6, 8].

```ruby
arr = [1,2,3,4].map{|e| e*2}
print arr
```
- output:
```bash
[2, 4, 6, 8]
```
7. Write Ruby code to select only even numbers from the array [1, 2, 3, 4, 5, 6].
```ruby
arr = [1,2,3,4,5,6].select{|e| e%2==0}
print arr
```
- output:
```bash
[2, 4, 6]
```
8. Write Ruby code to find the sum of numbers in the array [5, 10, 15].
```ruby
arr = [5,10,15]
sum = 0;

arr.each do |e|
sum+=e;
end
puts sum
```
- output:
```bash
30
```
9. Write Ruby code to check if any number in [1, 3, 5, 6] is even and if all numbers in [2, 4, 6] are even.
```ruby
puts [1, 3, 5, 6].any?{|e|e%2==0}
puts [2, 4, 6].all?{|e|e%2==0}
```
- output:
```bash
true
true
```
10. Write Ruby code to print "Pass" if marks are greater than or equal to 40, otherwise print "Fail".
```ruby
class Marks
    def check_marks(marks)
        if marks>=40
            return "Pass"
        end
        return "Fail"
    end       
end
puts Marks.new.check_marks(40)
```
- output:
```bash
pass
```
11. Write Ruby code to print "Not Active" unless a variable active is true.
```ruby
active = false
puts "Not Active" unless active
```
- output:
```bash
Not active
```
12. Write Ruby code to print numbers from 1 to 5 using a while loop.
```ruby
i = 1;
while i<=5
    puts i;
    i+=1
end
```
- output:
```bash
1
2
3
4
5
```
13. Write Ruby code to print numbers from 1 to 5 using an until loop.
```ruby
x = 6
j= 1;
until j==x
    puts j
    j+=1
end
```
- output:
```bash
1
2
3
4
5
```
14. Write Ruby code using loop and break to print numbers starting from 1 and stop when the number reaches 4.
```ruby
k=1
loop do  
    break if k==4;
    puts k;
    k+=1;
end
```
- output:
```bash
1
2
3
```
15. Write a Ruby class Student with attributes name and age, and a method details that prints the name and age.
```ruby
class Student
    def initialize(name , age)
        @name = name
        @age = age
    end
    def details 
        "Name:#{@name}\nAge:#{@age}"
    end
end
s1 = Student.new("Uday",20)
puts s1.details
```
- output:
```bash
Name:Uday
Age:20
```
16. Create two Ruby objects, print their object_id, and check whether the object IDs are the same or different.
```ruby
class Student
    def initialize(name , age)
        @name = name
        @age = age
    end
    def details 
        "Name:#{@name}\nAge:#{@age}"
    end
end
s1 = Student.new("Uday",20)
puts s1.details

class Teacher
    def initialize(name,age)
        @name = name
        @age = age
    end
    def details 
        "Name:#{@name}\nAge:#{@age}"
    end
end

s1 =  Student.object_id
s2 =  Teacher.object_id
puts s1
puts s2
puts s1==s2
```
- output:
```bash
16
24
false
```
17. Write Ruby code to print the ancestor chain of a custom class Student.
```ruby
class Student
    def initialize(name , age)
        @name = name
        @age = age
    end
    def details 
        "Name:#{@name}\nAge:#{@age}"
    end
end
s1 = Student.ancestors
```
- output:
```bash
Student
Object
Kernel
BasicObject
```
18. Write a Rails route that handles a GET request and maps to the index action of StudentsController.
```ruby
get 'students', to: 'students#index'
```
19. Write a Rails controller action index that fetches all students and stores them in an instance variable.
```ruby
   def index
     @students = Student.all
   end
```
20. Write a Rails model validation to ensure the email attribute is present for a Student.
```ruby
validates :student,presence:true
```
21. Write a Rails scope to fetch records created within the last 7 days.
```ruby
 scope, seven_days_ago->{where('createdAt<=?',7.days.ago)}
```
22. Write the Rails console command to create a new student with a name and email.
```ruby
 Student.create(name: "Uday", email: "uday@example.com")
```
23. Write a private strong parameters method in a Rails controller to permit name and email for Student.
```ruby
 def product_params
   params.expect(product: [:name, :email])
 end
```
24. Write Rails model code to allow multiple file uploads for a record.
```ruby
 class Product < ApplicationRecord
   has_many_attached :images
 end
```
25. Write Rails model code to enable rich text content for a description field.
```ruby
 class Product < ApplicationRecord
   has_rich_text :description
 end
 ```