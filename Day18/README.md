#  Day 18 – Active Support in Ruby on Rails

##  What is Active Support?

**Active Support** is a Ruby on Rails component that provides **utility classes, extensions, and helpers** to make Ruby and Rails development easier and more expressive.

 These features are **available only inside Rails**, not in plain Ruby.

---

##  Main Components of Active Support

### 1️ Core Extensions

Active Support extends core Ruby classes such as:

* **Date** (date calculations)
* **Time** (time calculations)
* **String**
* **Array**
* **Hash**
* **Object**

These extensions add many helper methods that do **not exist in pure Ruby**.

---

### 2️ Instrumentation (Publish / Subscribe)

Active Support provides an **event notification system** using:

```ruby
ActiveSupport::Notifications
```

* Used internally by Rails (e.g., SQL queries, controller actions)
* Helps in **logging, monitoring, and performance analysis**

---

###  ActiveSupport::Concern

* Used to share **common logic** between models/controllers
* Helps organize modules cleanly
* Avoids messy `included do` blocks

---

### 4️ Multi-language Translations (I18n)

* Rails uses **I18n (Internationalization)** for translations
* Translations are configured using YAML files like:

```yaml
config/locales/en.yml
```

---

##  Active Support Time & Date Methods

*(Available only in Rails)*

---

## 1️ Time.zone.now

Returns the **current time based on the Rails application time zone**.

```ruby
Time.zone.now
# => 2026-02-04 05:40:23 UTC
```

> ✔ Preferred over `Time.now` in Rails applications

---

## 2️ Time Calculations (`n.day`, `n.week`, etc.)

Active Support adds **human-readable time helpers**.

```ruby
a = Time.zone.now
```

### Examples

```ruby
a + 2.days
# => Adds 2 days

a + 3.weeks
# => Adds 3 weeks

a + 3.months
# => Adds 3 months

a + 2.hours
# => Adds 2 hours
```

### Supported Units

* `seconds`
* `minutes`
* `hours`
* `days`
* `weeks`
* `months`
* `years`

>  **Correction:**
> `n.day` and `n.days` both work, but **plural form is preferred** for readability.

---

## 3️ Date Methods (Active Support Extensions)

### Common Date Helpers

```ruby
Date.today
Date.new(year, month, day)
```

---

### Beginning Helpers

```ruby
Date.today.beginning_of_day
Date.today.beginning_of_week
Date.today.beginning_of_month
Date.today.beginning_of_year
```

---

### End Helpers

```ruby
Date.today.end_of_day
Date.today.end_of_week
Date.today.end_of_month
Date.today.end_of_year
```

> These helpers **do not exist in pure Ruby**, only in Rails.

---

## 4️ I18n (Internationalization)

`I18n` is the class responsible for handling translations.

### Example

```ruby
I18n.t('hello')
```

### Translation File (`en.yml`)

```yaml
en:
  hello: "Hello World"
```

---

## 5️ String, Array, Hash Helper Methods

Active Support adds helpful predicate methods.

### blank?

```ruby
" ".blank?   # true
[].blank?    # true
{}.blank?    # true
nil.blank?   # true
```

---

### nil?

```ruby
" ".nil?   # false
[].nil?    # false
{}.nil?    # false
nil.nil?   # true
```

---

### present?

```ruby
"abc".present?   # true
[].present?      # false
{}.present?      # false
```

---

### empty?

```ruby
"".empty?   # true
[].empty?   # true
{}.empty?   # true
```

>  **Important Difference**

* `empty?` → works only for collections/strings
* `blank?` → works for **nil, empty, or whitespace**

---

##  N+1 Query Problem

### What is the N+1 Query Problem?

The **N+1 query problem** occurs when:

1. One query fetches parent records
2. Additional queries are fired **for each child record**

This usually happens due to **lazy loading**.

---

### Example (Bad Practice)

```ruby
User.all.each do |user|
  puts user.posts.count
end
```


 Causes **1 query for users + N queries for posts**

---

### Solution: Eager Loading using `includes`

```ruby
User.includes(:posts).each do |user|
  puts user.posts.count
end
```

✔ Fetches all data using **minimum queries**

---
