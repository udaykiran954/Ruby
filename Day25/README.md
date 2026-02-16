# Day-25

# Object-Oriented Programming in Ruby & Rails

Ruby is a pure object-oriented language. Everything in Ruby is an object — numbers, strings, classes, even `nil`.

In Rails, understanding OOP deeply is very important because models, controllers, services — everything follows OOP principles.

---

# 1️⃣ Types of Methods in a Class

In Ruby, a class can have:

1. **Class Methods**
2. **Instance Methods**

---

## 1. Class Methods

Class methods belong to the class itself, not to individual objects.

They are called using:

```ruby
ClassName.method_name
```

Example:

```ruby
User.greet
```

---

## 🔹 Ways to Define Class Methods

### 1.1 Using `self`

```ruby
class User
  def self.greet
    "Hello"
  end
end
```

Here, `self` refers to the class object.

---

### 1.2 Using Class Name

```ruby
class User
  def User.greet
    "Hello"
  end
end
```

This works exactly like `self`, but using `self` is cleaner and preferred.

---

### 1.3 Using `class << self`

Useful when defining multiple class methods.

```ruby
class User
  class << self
    def greet
      "Hello"
    end

    def goodbye
      "Bye"
    end
  end
end
```

This opens the singleton class of `User`.

---

# 2️⃣ Instance Methods

If you define a method normally inside a class (without `self` or class name), it becomes an instance method.

```ruby
class User
  def details
    "User details"
  end
end
```

Usage:

```ruby
user = User.new
user.details
```

Instance methods work on individual objects.

---

# 3️⃣ Getters and Setters

To access or modify them, we use getters and setters.

---

## 3.1 Manual Getter & Setter

```ruby
class User
  def name
    @name
  end

  def name=(value)
    @name = value
  end
end
```

Usage:

```ruby
user = User.new
user.name = "Uday"
puts user.name
```

---

## 3.2 Using Accessor Methods

Ruby provides shortcuts:

* `attr_reader` → getter only
* `attr_writer` → setter only
* `attr_accessor` → both

```ruby
class User
  attr_accessor :name, :age
end
```

This automatically creates:

* `name`
* `name=`
* `age`
* `age=`

---

# 4️⃣ Duck Typing

Ruby follows dynamic typing.

Ruby does not care about the object's class.
It only checks whether the object responds to a method.

Example:

```ruby
def make_sound(animal)
  animal.sound
end
```

If the object has a `sound` method, it works — regardless of its class.

This is called Duck Typing.

> If it behaves like a duck, Ruby treats it like a duck.

Ruby focuses on behavior, not type.

---

# 5️⃣ Method Overriding and `super`

---

## 5.1 Method Overriding

A child class can redefine a method from its parent.

```ruby
class Parent
  def greet
    "Hello"
  end
end

class Child < Parent
  def greet
    "Hi"
  end
end
```

The child version replaces the parent method.

---

## 5.2 Using `super`

If we want to reuse the parent’s logic inside the child method, we use `super`.

```ruby
class Parent
  def greet
    "Hello"
  end
end

class Child < Parent
  def greet
    super + " Uday"
  end
end
```

Output:

```
Hello Uday
```

Important points about `super`:

* `super` calls the parent method with the same name.
* `super` automatically passes the same arguments.
* You should NOT write `super.method_name`
* Just write `super`.

Example with arguments:

```ruby
class Parent
  def greet(name)
    "Hello #{name}"
  end
end

class Child < Parent
  def greet(name)
    super(name) + "!"
  end
end
```

---

## 5.3 Method Overloading

Ruby does not support traditional method overloading (same method name with different parameters).

However, we can handle it using:

### Default arguments

```ruby
def greet(name = "Guest")
  "Hello #{name}"
end
```

### Splat operator

```ruby
def greet(*names)
  names.each { |name| puts "Hello #{name}" }
end
```

---

# 6️⃣ Core OOP Concepts

---

## 6.1 Inheritance

Inheritance allows a class to reuse code from another class.

```ruby
class Animal
  def speak
    "Sound"
  end
end

class Dog < Animal
end
```

`Dog` inherits the `speak` method.

Ruby supports **single inheritance only**.

---

## 6.2 Encapsulation

Encapsulation hides internal logic using access modifiers:

* `public`
* `private`
* `protected`

Example:

```ruby
class User
  def display
    secret_method
  end

  private

  def secret_method
    "Hidden logic"
  end
end
```

Private methods cannot be called directly outside the class.

---

## 6.3 Polymorphism

Polymorphism allows different classes to respond to the same method name differently.

Example:

```ruby
class Dog
  def sound
    "Bark"
  end
end

class Cat
  def sound
    "Meow"
  end
end
```

Both respond to `sound`, but behavior differs.

Polymorphism is achieved through:

* Method overriding
* Duck typing

---

# 7️⃣ Modules in Ruby

Modules are used to group related methods and share them across classes.

They help:

* Avoid code duplication
* Share common behavior
* Work around single inheritance
* Organize reusable logic

Modules cannot be instantiated.

You cannot create objects from modules.

---

# 8️⃣ include vs extend vs prepend

---

## 8.1 include

Adds module methods as instance methods.

```ruby
module Trackable
  def track
    "Tracking enabled"
  end
end

class Car
  include Trackable
end

Car.new.track
```

---

## 8.2 extend

Adds module methods as class methods.

```ruby
module Reportable
  def report
    "Generating report"
  end
end

class User
  extend Reportable
end

User.report
```

---

## 8.3 prepend

`prepend` inserts the module before the class in method lookup order.

```ruby
module Greeting
  def hello
    "Hello from module"
  end
end

class User
  prepend Greeting

  def hello
    "Hello from class"
  end
end
```

Output:

```
Hello from module
```

Because `prepend` gives priority to the module.

---

# 9️⃣ Method Lookup Order

When Ruby searches for a method, it follows this order:

1. Prepended modules
2. The class itself
3. Included modules
4. Parent class
5. Object
6. Kernel
7. BasicObject

You can check the lookup chain using:

```ruby
User.ancestors
```

---

# 🔟 Rails Concerns

In Rails, Concerns are special modules used to organize reusable logic.

They are usually stored in:

```
app/models/concerns
app/controllers/concerns
```

Concerns help:

* Keep models and controllers clean
* Avoid large, messy classes
* Share common logic between multiple models/controllers

---

## Example: Model Concern

```ruby
# app/models/concerns/trackable.rb
module Trackable
  extend ActiveSupport::Concern

  included do
    before_save :track_action
  end

  def track_action
    puts "Tracking record..."
  end
end
```

Then use it in a model:

```ruby
class User < ApplicationRecord
  include Trackable
end
```

`ActiveSupport::Concern` provides a cleaner structure and handles dependencies properly.

---
