# Day 27 – Anonymous Methods, Procs, Lambdas & Meta Programming in Ruby

---

## 1️⃣ Anonymous Methods Using Blocks

A **block** is an anonymous piece of code that can be passed to a method.

Blocks are not objects. They are just chunks of code attached to method calls.

### 🔹 Example 1 – Using `yield`

```ruby
def simple_method
  yield
  yield
end

simple_method { puts "hello all" }
simple_method { puts "multiple yield" }
```

### Output

```
hello all
hello all
multiple yield
multiple yield
```

 `yield` executes the block passed to the method.

---

### 🔹 Example 2 – Passing Arguments to Block

```ruby
def simple_method1
  yield "uday", "nani"
end

simple_method1 do |*args|
  puts args
  args.each do |p|
    puts "Student is #{p}"
  end
end
```

###  Output

```
uday
nani
Student is uday
Student is nani
```

---

### 🔹 Example 3 – Multiple Yields

```ruby
def method1
  yield "uday", "ruby"
  yield
end

method1 do |*args|
  args.each_cons(2) do |a, b|
    puts "name is #{a} course is #{b}"
  end
end
```

###  Output

```
name is uday course is ruby
```

Second yield sends no arguments, so nothing prints.

---

 Important:

```ruby
# m1 {puts "hii"} {puts "hii2"}  #  Error
```

Ruby allows only one block per method call.

---

## 2️⃣ Procs in Ruby

A **Proc** is an object version of a block.

Unlike blocks, Procs are objects.

---

### 🔹 Creating and Calling Proc

```ruby
p = Proc.new { puts "proc hii hello" }
p.call
```

###  Output

```
proc hii hello
```

---

###  Parameterized Proc

```ruby
p1 = Proc.new { |a| puts "hello #{a}" }
p1.call("uday")
```

###  Output

```
hello uday
```

---

### 🔹 Proc Accepts Missing Arguments

```ruby
p2 = Proc.new { |a| puts "hello #{a}" }
p2.call
```

###  Output

```
hello 
```

 Proc treats missing arguments as `nil`.

---

###  Proc with Multiple Parameters

```ruby
p3 = Proc.new { |a, b| puts "values are #{a}, #{b}" }
p3.call(10, 20)
```

### Output

```
values are 10, 20
```

---

### 🔹 Passing Proc as Parameter

```ruby
def demo(proc)
  proc.call
end

demo(Proc.new { puts "hello proc" })
```

###  Output

```
hello proc
```

---

###  Proc Return Behavior (Important Concept )

```ruby
def demo3
  a1 = Proc.new { return "proc inside the method" }
  a1.call
  "this is returned from method"
end

puts demo3
```

###  Output

```
proc inside the method
```

 Proc's `return` exits the entire method immediately.

This is very important difference between Proc and Lambda.

---

## 3️⃣ Lambdas in Ruby

Lambda is similar to Proc but behaves differently.

Created using `->`

---

### 🔹 Basic Lambda

```ruby
l = -> { "hello lambdas" }
puts l.call
```

###  Output

```
hello lambdas
```

---

###  Parameterized Lambda

```ruby
p1 = ->(a) { puts "value of a is #{a}" }
p1.call(10)
```

###  Output

```
value of a is 10
```

If you don’t pass argument:

```ruby
p1.call
```

 ArgumentError

 Lambda strictly checks argument count.

---

### 🔹 Lambda Return Behavior

```ruby
def demo_lambda
  l1 = -> { return "hello" }
  puts l1.call
  "hello uday"
end

puts demo_lambda
```

###  Output

```
hello
hello uday
```

 Lambda return exits only from lambda, not from method.

---

##  Proc vs Lambda – Key Differences

| Feature         | Proc         | Lambda            |
| --------------- | ------------ | ----------------- |
| Arguments       | Flexible     | Strict            |
| Return behavior | Exits method | Exits lambda only |
| Use case        | Callbacks    | Scopes in Rails   |

 In Rails, lambdas are commonly used for scopes.

---

# 4️⃣ Singleton Class / Eigenclass / Metaclass

All three mean the same thing.

It allows adding methods to only one specific object.

---

##  Example – Singleton Method

```ruby
class Animal
  def any
    "all animals eat"
  end
end

a1 = Animal.new

class << a1
  def cat
    "hello i am a cat"
  end
end

puts a1.any
puts a1.cat
```

###  Output

```
all animals eat
hello i am a cat
```

 Only `a1` has `cat` method.

Other Animal objects don’t.

---

## 🔹 Using `singleton_class.class_eval`

```ruby
a1.singleton_class.class_eval do
  def drink
    "cat drink milk"
  end
end

puts a1.drink
```

###  Output

```
cat drink milk
```

---

## 5️⃣ class_eval vs instance_eval

### 🔹 class_eval

Adds instance methods.

```ruby
class Man
end

Man.class_eval do
  def m1
    "simple method"
  end
end

puts Man.new.m1
```

###  Output

```
simple method
```

---

###  instance_eval on Class

Adds class method.

```ruby
Man.instance_eval do
  def m2
    "class method"
  end
end

puts Man.m2
```

###  Output

```
class method
```

---

###  instance_eval on Object

```ruby
obj = Man.new

obj.instance_eval do
  def method1
    "hello"
  end
end

puts obj.method1
```

###  Output

```
hello
```

---

##  Accessing Instance Variables using instance_eval

```ruby
class Vehicle
  def initialize(name, model)
    @name = name
    @model = model
  end
end

v = Vehicle.new("car", "benz")

v.instance_eval do
  def m1
    puts @name
  end
end

v.m1
```

###  Output

```
car
```

---

# 6️⃣ Anonymous Classes

```ruby
klass = Class.new do
  def greet
    "hello from anonymous class"
  end
end

obj = klass.new
puts obj.greet
```

###  Output

```
hello from anonymous class
```

Anonymous classes are useful in dynamic systems and testing.

---

# 7️⃣ Singleton Design Pattern

 Design Pattern = Reusable solution to common problem.

Singleton Pattern:
Allows only one instance of a class.

---

