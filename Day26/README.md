# Day 26 – Meta Programming in Ruby

##  What is Meta Programming?

Meta programming means:

> Writing code that writes or modifies other code at runtime.

Ruby is famous for this. Rails itself heavily uses meta programming (ActiveRecord, validations, scopes, etc).

---

# 1️⃣ `define_method`

##  What It Does

`define_method` allows you to dynamically create methods instead of manually writing many similar methods.

This is useful when:

* Methods follow a pattern
* Logic is repetitive
* You want cleaner & shorter code

---

##  Without define_method

```ruby
class User
  attr_accessor :role

  def admin?
    role == "admin"
  end

  def guest?
    role == "guest"
  end

  def member?
    role == "member"
  end
end
```

Too repetitive 

---

##  With define_method

```ruby
class User
  attr_accessor :role

  ["admin", "guest", "member"].each do |role_name|
    define_method("#{role_name}?") do
      role == role_name
    end
  end
end

u1 = User.new
u1.role = "member"

puts u1.member?   # true
puts u1.admin?    # false
```

###  What’s Happening?

* Loop runs 3 times
* Each time it creates a method:

  * `admin?`
  * `guest?`
  * `member?`
* These methods are created dynamically at runtime.

---

###  Important Note

Avoid using `puts` inside define_method if you want a boolean return value.

This is correct:

```ruby
role == role_name
```

Not this:

```ruby
puts role == role_name   # returns nil
```

---

###  Where Rails Uses This

Rails uses `define_method` in:

* `validates`
* `has_many`
* `belongs_to`
* scopes

---

# 2️⃣ `method_missing`

## 🔹 What It Does

When you call a method that does not exist, Ruby raises:

```
NoMethodError
```

But if you define `method_missing`, Ruby calls it instead.

---

## Example

```ruby
class Vendor
  def method_missing(method_name, *args)
    if method_name.to_s.start_with?("find_by_")
      attribute = method_name.to_s.sub("find_by_", "")
      puts "Searching by #{attribute}: #{args.first}"
    else
      super
    end
  end
end

v1 = Vendor.new
v1.find_by_name("uday")
```

### Output:

```
Searching by name: uday
```

---

##  How It Works

* Ruby doesn’t find `find_by_name`
* Ruby calls `method_missing`
* We capture method name
* Extract attribute
* Execute custom logic

---

##  Real World Example

Rails ActiveRecord:

```ruby
User.find_by_name("uday")
User.find_by_email("abc@gmail.com")
```

These methods are not explicitly written. Rails handles them dynamically using meta programming.

---

# 3️⃣ Monkey Patching 

##  What It Means

You can reopen any existing class in Ruby and:

* Override existing methods
* Add new methods

---

## Example

```ruby
class String
  def upcase
    "upcase overwritten"
  end

  def custom_downcase
    downcase
  end
end

str = "uday"

puts str.upcase            # upcase overwritten
puts "UDAY".custom_downcase  # uday
```

---

##  Danger of Monkey Patching

Overriding core methods can break:

* Gems
* Rails
* Other developers’ code

For example:

If you override `upcase`, every string in entire app changes behavior 

---

##  Safe Alternative

Use:

* Modules
* Refinements
* Helper methods

Monkey patching should be used very carefully.

---

# 4️⃣ Accessing Private Methods

Normally:

```ruby
class Messenger
  private
  def secret
    "private method"
  end
end

m = Messenger.new
m.secret   #  Error
```

---

##  Using `send`

```ruby
class Messenger
  def email(msg)
    "Message sent: #{msg}"
  end

  private

  def secret
    "private method"
  end
end

m = Messenger.new

puts m.send(:email, "Hello")
puts m.send(:secret)
puts m.__send__(:secret)
```

---

##  Difference Between `send` and `__send__`

* `send` is normal method
* `__send__` is internal Ruby version
* If someone overrides `send`, you can still use `__send__`

---

## Security Warning

Using `send` can break encapsulation.

Never use `send` with user input.

---

##  Other Useful Introspection Methods

```ruby
puts m.methods
puts m.private_methods
puts m.public_methods
puts m.class
puts m.inspect
```

This is called **reflection** (inspecting objects at runtime).

---

# 5️⃣ `class_eval` and `instance_eval`

These are powerful meta programming tools.

---

##  class_eval

Adds instance methods to class.

```ruby
class Simple
end

Simple.class_eval do
  def m1
    "class eval method"
  end
end

puts Simple.new.m1
```

---

##  instance_eval

Adds class methods.

```ruby
Simple.instance_eval do
  def m2
    "instance eval method"
  end
end

puts Simple.m2
```

---

##  Difference

| Method        | Adds What?      |
| ------------- | --------------- |
| class_eval    | Instance method |
| instance_eval | Class method    |

---

# 🎯 Bonus: Why Meta Programming is Powerful

It allows:

* Dynamic method creation
* DSL creation (like Rails)
* Cleaner repetitive code
* Flexible frameworks

Example DSL in Rails:

```ruby
class Post < ApplicationRecord
  validates :title, presence: true
end
```

That `validates` method is meta programming magic.

---

