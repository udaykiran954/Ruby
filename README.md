# Ruby on Rails Internship – Day-wise Learning Notes
---

#  Internship Daily Report

## Dayspring Technologies

---

#  Day 1

## Introduction

First day at **Dayspring Technologies** as an intern.
Completed installation of **Ruby** and **Rails** and successfully compiled my first Ruby program.

## Ruby

* Everything in Ruby is an **object** (even methods)
* Follows **SOLID principles** (Interface principle is implicit)
* Very **simple, readable**, and expressive

## Rails

* Rails is a **framework of Ruby**
* Used to build **dynamic web applications**
* Follows **MVC architecture**

## Commands

```bash
ruby -v
```

**Output**

```
ruby 3.x.x
```

```bash
gem install rails
```

**Output**

```
Successfully installed rails
```

```bash
rails new AppName
rails s
rails s -p 3001
```

---

#  Day 2

## Creating Rails App with Database

```bash
rails new appname -d mysql
```

## Rails Console

```bash
rails console
rails c
```

## Database Commands

```bash
rails db:create
rails db:seed
rails db:migrate
```

## Scaffold

```bash
rails generate scaffold Customer name:string email:string
```

**Generated Files**

```
model
controller
views
migration
routes
```

---

#  Day 3

## Core Concepts

* Syntactic Sugar
* Convention over Configuration

## Rails Flow

```
Route
 |
Controller (actions)
 |
Model
 |
View
```

## Important Files

* `routes.rb` → defines endpoints
* `bin/` → auto-generated (do not modify)
* `config/`

  * environments
  * initializers
  * locales

Other files:

* `rake`
* `boot.rb`
* `application.rb`

---

#  Day 4

## Configuration Files

* `secrets.rb` → secured data
* `credentials.yml.enc` → environment secrets
* `database.yml` → DB config
* `deploy.yml` → deployment steps
* `environment.rb` → mandatory
* `importmap.rb` → Rails 7
* `puma.rb` → default server

## Routing Types

* member route
* collection route
* nested route

---

#  Day 5 (Ruby)

## Variables

```ruby
$college_name = "IIIT"     # Global
@@count = 0               # Class
@name = "uday"            # Instance
a = 10                    # Local
PI = 3.14                 # Constant
```

## Datatypes

```ruby
a = 10
puts a.class
```

**Output**

```
Integer
```

```ruby
b = "uday"
puts b.class
```

**Output**

```
String
```

```ruby
c = :uday
puts c.class
```

**Output**

```
Symbol
```

## User Input

```ruby
a = gets.chomp
puts a
```

**Input**

```
Uday
```

**Output**

```
Uday
```

## Type Conversion

```ruby
a = "10"
puts a.to_i
puts a.to_f
puts a.to_s
```

**Output**

```
10
10.0
10
```

---

#  Day 6 (Ruby)

## Loops

### for

```ruby
for i in 1..5
  puts i
end
```

**Output**

```
1
2
3
4
5
```

### while

```ruby
i = 1
while i <= 3
  puts "hi"
  i += 1
end
```

**Output**

```
hi
hi
hi
```

### loop

```ruby
m = 1
loop do
  puts "hello"
  break if m == 3
  m += 1
end
```

**Output**

```
hello
hello
hello
```

### until

```ruby
j = 0
until j > 3
  puts j
  j += 1
end
```

**Output**

```
0
1
2
3
```

### next

```ruby
for k in 1..5
  next if k.even?
  puts k
end
```

**Output**

```
1
3
5
```

### redo

```ruby
flag = true
for x in 2..4
  puts x
  if x == 2 && flag
    flag = false
    redo
  end
end
```

**Output**

```
2
2
3
4
```

## Array Methods

```ruby
arr = [1,2,3,4,5,6]
puts arr.select { |i| i.even? }
puts arr.reject { |i| i.even? }
puts arr.all? { |n| n > 0 }
puts arr.any? { |n| n > 5 }
```

**Output**

```
2
4
6
1
3
5
true
true
```

```ruby
arr = [1,2,3]
arr.map! { |n| n + 5 }
puts arr
```

**Output**

```
6
7
8
```

---

#  Day 7 (Ruby)

## Inheritance

```ruby
class Base
  def welcome
    "welcome from base"
  end
end

class Child < Base
  def welcome
    super
    "welcome from child"
  end
end

obj = Child.new
puts obj.welcome
```

**Output**

```
welcome from child
```

## Object Hierarchy

```
Child → Base → Object → Kernel → BasicObject
```

## Methods

```ruby
puts Child.ancestors
puts obj.respond_to?(:welcome)
puts obj.respond_to?(:test)
```

**Output**

```
Child
Base
Object
Kernel
BasicObject
true
false
```

---

#  Day 8 (Ruby)

## Conditional Statements

### if / else

```ruby
stock = 0
if stock > 0
  puts "Available"
else
  puts "Not available"
end
```

**Output**

```
Not available
```

### Ternary

```ruby
is_active = true
puts is_active ? "present" : "absent"
```

**Output**

```
present
```

### unless

```ruby
email = false
unless email
  puts "email unavailable"
else
  puts "email available"
end
```

**Output**

```
email unavailable
```

---

#  Day 9 (Rails)

## Validations

```ruby
validates :name, format: { with: /\A[a-zA-Z]+\z/ }
validates :price, numericality: { greater_than_or_equal_to: 100 }
validates :description, length: { maximum: 500 }
```

**Invalid Input Output**

```
Price must be greater than or equal to 100
```

## Custom Validation

```ruby
validate :check_price

def check_price
  errors.add(:price, "invalid") if stock == 0 && price > 0
end
```

---

#  Day 10 (Rails)

## Scopes

```ruby
scope :out_of_stock, -> { where(stock: 0) }
scope :whitelisted_products, -> { where(id: [1,2,3]) }
scope :unique_emails, -> { select(:email).distinct }
scope :blacklisted_customers, ->(ids) { where(id: ids) }
```

```ruby
Product.out_of_stock
```

**Generated SQL**

```sql
SELECT * FROM products WHERE stock = 0;
```
---



 # Day12

## Generating controller
```bash
rails generate controller admins
```
- above command generate following files
- app\controllers\admins_controller.rb-->controller file

- app\views\admins->views admin file

- app/helpers/admin_helper.rb → helper file

- test/controllers/admin_controller_test.rb → controller test file

# Generating a Model
```bash
rails generate model admin
```
- Rails creates files related to database and business logic: This comes under Active Record.

- app/models/admin.rb → model file
- db/migrate/XXXXXXXX_create_admins.rb → migration file
- test/models/admin_test.rb → model test file
- test/fixtures/admins.yml → test data

# Deleting view Page

- If we delete the show.html.erb file and access the show page, will get this error:
```bash
ActionController::UnknownFormat in CustomersController#show
CustomersController#show is missing a template for this request format.
```
- Reason: if we request show page it will trigger to corresponding UI page(show.html.erb)when it is not found shows above error 

# Removing Controller method
- If we remove from the controller method (ex:``` def show end```), there is no error in Rails version 8.
- Reason:
1. Rails 8 handles missing actions
2. If the route or action is not used, it does not crash the app
# Changes in routes.rb
```ruby
1. resources :products, except: [:show,:new]
2. resources :products, only: [:new, :destroy]
```
- if we use except for routes, it will not allow you to request the mentioned routes ,if we try to use them it will throw ``` routing error```

- if we use only for routes, it will allow you only to request mentioned routes,if we request other routes it will also throw ``` routing error```

# action components 
- action components is one of the feature of rails this components will help us in many examples

## Rails Components

| Name              | Feature Area                | Description                                                                 | Introduced |
|-------------------|-----------------------------|-----------------------------------------------------------------------------|------------|
| Active Model      | Model functionality         | Adds validations, callbacks, naming, and conversion features to plain Ruby objects | Rails 3.0 |
| Active Record     | Database interaction (ORM)  | Maps Ruby objects to database tables and provides CRUD operations            | Rails 1.0 |
| Action View       | View layer                  | Renders HTML using templates such as ERB, HAML, and partials                 | Rails 1.0 |
| Action Controller | Controller layer            | Processes incoming requests, handles responses, and coordinates models and views | Rails 1.0 |
| Active Job        | Background processing       | Provides a unified interface for running background jobs with different queue adapters | Rails 4.2 |
| Active Support    | Core extensions & utilities | Extends Ruby with helpful utility methods and framework support features     | Rails 1.0 |
| Action Mailer     | Email services              | Enables sending and receiving emails using mailer classes                    | Rails 1.0 |
| Action Mailbox    | Incoming email processing   | Routes incoming emails to controllers for application-level processing       | Rails 6.0 |
| Action Cable      | Real-time communication     | Enables WebSocket-based features like live chat and notifications            | Rails 5.0 |
| Active Storage    | File management             | Handles file uploads, storage, and attachments using cloud or local services | Rails 5.2 |
| Action Text       | Rich text handling          | Supports rich text content with embedded images using a built-in editor      | Rails 6.0 |
| Action Dispatch   | Routing & middleware stack  | Manages request routing, sessions, cookies, and middleware integration       | Rails 1.0 |


# Day13
## Adding the column to a table in rails application
```ruby
rails generate migration AddColumnColnameToTablename colname:datatype
rails generate migration AddColumnPhone_numberToCustomer phone_number:integer
rails db:migrate
```
- it will add below file to your db/migrate folder when you run above commands 
1. db/migrate/20260128044536_add_column_phone_to_customer.rb

## installing action-text in our application
```ruby
rails action_text:install
rails db:migrate
```
- it will add the below 4 tables in Schema.rb file 
1. action_text_rich_texts
2. active_storage_attachments
3. active_storage_blobs
4. active_storage_variant_records

- it will add below 2 files in db/migrate folder 
1. db/migrate/20260128045359_create_active_storage_tables.active_storage.rb
2. db/migrate/20260128045360_create_action_text_tables.action_text.rb

-it will add below file to app\assets\stylesheets
1. app\assets\stylesheets\actiontext.css

-it will add below folder to app/views
1. app/views/active_storage/blobs/_blob.html.erb

- it will add below folder to app/views/layouts
1. app/views/layouts/action_text/contents/_content.html.erb

- it will add below folder to app/views/test/fixtures
1. test/fixtures/action_text/rich_texts.yml

- command to check files we are modified in folder
 ```bash
 git status
 ```
 - command to check files we are modified in particular file
 ```bash
 git diff applicationpath
 ```
# Task1 
- After installing the action-text it will modify the schema.rb file by adding 4 tables mentioned above 
- by defaultly there is a connection between "active_storage_attachments", and "active_storage_blobs"(adds the foreinkey as blob_id in "active_storage_attachments" which refers the id of "active_storage_blobs")
- by defaultly there is a connection between "active_storage_variant_records", and "active_storage_blobs"(adds the foreinkey as blob_id in "active_storage_variant_records" which refers the id of "active_storage_blobs")

# Task2
```ruby
a1 = [1,2,3,4,5,6]
a2 = [1,3,5]
a3 = a1 & a2 # it will give all common elements(intersect)
a4 = a1 || a2 # it will give all elemnts(union)
print a3 #[1, 3, 5] 
puts 
print a4 #[1, 2, 3, 4, 5, 6]
```
# Task3
## params.inspect
- params.inspect is usually used for debugging—to see what parameters are actually coming from the form/request.
- This will
1. Stop execution
2. Show all permitted params in the error page
```ruby
 def create
    raise customer_params.inspect
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
```
- It giving ``` #<ActionController::Parameters {"name" => "jhon", "email" => "1@gmail.com", "about_me" => "<div>jhon is a english name</div>"} permitted: true> ```

## Day14
# installing acton-storage
- if we install action_text in our application automatically action_storage will be installed, but you need to install only action-storage you need to run below commands

```ruby
rails action_storage:install
rails db:migrate
```
- After installing action_Storage to use that we need to follow three steps 
1. we need to add column using model 
ex:-
```ruby
class Product < ApplicationRecord
    has_many_attached:product_image
    has_rich_text:review
end
```
2. Then we need to add it into params in controller class
```ruby
class ProductsController < ApplicationController
 def product_params
      params.expect(product: [ :name, :description, :price, :stock, :is_active, :review ,product_image:[]])
    end
end
```

3.Then you need make changes in views files
```html
   <div class="mb-3">
    <%= form.label :review, class: "form-label" %>
    <%= form.rich_text_area :review, class: "form-control", placeholder: "enter review" %>
  </div>
  <div class="mb-3">
    <%= form.label :product_image, class: "form-label" %>
    <%= form.file_field :product_image, class: "form-control", placeholder: "enter",multiple:true %>
  </div>
```
-  Note: action-storage present in from rails 5.2 before and all we used gems to add storage ex:- carrierwave, imageproceesing,paperclip,varience

# Task1
## Creating column invoice for product model using action-storage
```ruby
#product.rb 
has_one_attached :invoice
#products_controller.rb
 def product_params
      params.expect(product: [  :name,
      :description,
      :price,
      :stock,
      :is_active,
      :review,
      :invoice,
      product_image: []])
end
```
```html
 </div>
    <div class="mb-3">
    <%= form.label :invoice, class: "form-label" %>
    <%= form.file_field :invoice, class: "form-control", placeholder: "enter",multiple:true %>
  </div>
```

# Task2
## using migration add date(DOB) -->customer
```ruby
PS D:\Ruby Practice\Day2\demp-app> rails generate migration AddColumnDobToCustomer Dob:date
      invoke  active_record
      create    db/migrate/20260129095506_add_column_dob_to_customer.rb
PS D:\Ruby Practice\Day2\demp-app> rails db:migrate
== 20260129095506 AddColumnDobToCustomer: migrating ===========================
-- add_column(:customers, :Dob, :date)
   -> 0.0064s
== 20260129095506 AddColumnDobToCustomer: migrated (0.0066s) ==================

PS D:\Ruby Practice\Day2\demp-app>
```

---

#  Day 15 – Action Mailer

## 🔹 What is Action Mailer?

**Action Mailer** is a Rails component used to **send emails or notifications** from a Rails application.

* It is **installed by default** when a Rails application is created
* No separate installation is required
* Used for:

  * Welcome emails
  * Account verification
  * Password reset
  * Notifications

---

## 🔹 Step 1: Generate a Mailer

```ruby
rails generate mailer ProductMailer
```

>  `rails db:migrate` is **not required** here because mailers do not create database tables.

### Files Generated

```
app/mailers/product_mailer.rb
app/views/product_mailer/
test/mailers/product_mailer_test.rb
test/mailers/previews/product_mailer_preview.rb
```

---

## 🔹 Step 2: Enable Action Mailer (Optional Clarification)

In modern Rails versions, **this line already exists**:

```ruby
require "action_mailer/railtie"
```

 You **do not need to add it manually** unless it was removed.

---

##  Step 3: Configure Mailer in Development Environment

 `config/environments/development.rb`

```ruby
config.action_mailer.perform_deliveries = true
config.action_mailer.delivery_method = :letter_opener
```

### Explanation

* `perform_deliveries = true` → allows emails to be sent
* `letter_opener` → opens emails in browser (development only)
* In production, SMTP is used instead

---

##  Step 4: Configure Routes for Letter Opener

 `config/routes.rb`

```ruby
if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
```

 View emails at:
`http://localhost:3000/letter_opener`

---

##  Step 5: Define Mailer Method

 `app/mailers/product_mailer.rb`

```ruby
class ProductMailer < ApplicationMailer
  def welcome_email
    @product = params[:product]
    mail(
      to: @product.email,
      subject: "Welcome to Rails Mailer Concept"
    )
  end
end
```

---

##  Step 6: Call Mailer from Controller

```ruby
def create
  @product = Product.new(product_params)

  if @product.save
    ProductMailer.with(product: @product).welcome_email.deliver_now
    redirect_to @product, notice: "Product was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
end
```

### Delivery Methods

* `deliver_now` → synchronous
* `deliver_later` → background job (recommended in production)

---

##  Step 7: Create Mailer View

 `app/views/product_mailer/welcome_email.html.erb`

>  The view filename **must match** the mailer method name.

---

##  Email Headers (Additional Info)

* **CC** → Carbon copy
* **BCC** → Blind carbon copy
* **In-Reply-To** → Email reply reference
* **X-Original-To** → Original recipient address

---

#  Day 16 – Action Mailbox

##  What is Action Mailbox?

**Action Mailbox** allows Rails to **receive and process incoming emails**.

 Unlike Action Mailer, it must be **explicitly installed**.

---

##  Step 1: Install Action Mailbox

```ruby
rails action_mailbox:install
rails db:migrate
```

### Files Generated

```
db/migrate/*_create_action_mailbox_tables.rb
app/mailboxes/application_mailbox.rb
```

---

##  Step 2: Generate a Mailbox

```ruby
rails generate mailbox Support
```

### Files Generated

```
app/mailboxes/support_mailbox.rb
test/mailboxes/support_mailbox_test.rb
```

>  `rails generate action_mailer support` is incorrect
>  Correct command is `rails generate mailbox Support`

---

##  Step 3: Configure Routing

 `app/mailboxes/application_mailbox.rb`

```ruby
class ApplicationMailbox < ActionMailbox::Base
  routing all: :support
end
```

 All incoming emails go to `SupportMailbox`

---

##  Step 4: Configure Production Ingress

 `config/environments/production.rb`

```ruby
config.action_mailbox.ingress = :any_ingress_server
```

Ingress examples:

* `:relay`
* `:postmark`
* `:sendgrid`
* `:mailgun`

---

#  Day 17 – Namespaced Models & Active Record Methods

##  Creating a Namespaced Model

```ruby
rails generate migration Product::Category
rails db:migrate
```

### Result

* Creates a `categories` table
* Model path: `Product::Category`

---

##  Adding Columns to Namespaced Model

```ruby
rails generate migration AddCategoryNameToProductCategory category_name:string
rails db:migrate
```

---

##  Active Record Insert Methods

### Insert (Single Record)

```ruby
Model.insert({ column: value })
```

>  Skips validations & callbacks

---

### Insert Multiple Records

```ruby
Model.insert_all([
  { column: value },
  { column: value }
])
```

---

##  Finding Records

```ruby
Model.find(id)        # raises exception if not found
Model.find_by(id: id) # returns nil if not found
```

---

##  Fetching Records by Position

```ruby
Model.first
Model.second
Model.third
Model.fourth
Model.fifth
Model.last
```

---

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

>  Preferred over `Time.now` in Rails applications

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

#  Day 19 – Associations in Ruby on Rails

Associations in Rails define **relationships between models (tables)**.
They help **ActiveRecord** understand how records are connected and allow **easy data access** without writing complex SQL queries.

### Example

A **User** can have:

* one **Vendor**
* many **Posts**
* many **Orders**

---

##  Types of Associations (Conceptual Level)

There are **4 logical types** of relationships between database tables:

### 1️ One-to-One

* One record in table A is linked to **one record** in table B
* **Example:** `User → Profile`

---

### 2️ One-to-Many

* One record in table A is linked to **many records** in table B
* **Example:** `User → Posts`

---

### 3️ Many-to-One

* Many records in table A belong to **one record** in table B
* **Example:** `Posts → User`

> 🔹 *This is the reverse of one-to-many and is implemented using `belongs_to`.*

---

### 4️ Many-to-Many

* Many records in table A are linked to many records in table B
* **Example:** `Students ↔ Courses`

---

##  Ways to Define Associations in Rails

Rails provides **6 association macros**:

1. `has_one`
2. `has_many`
3. `belongs_to`
4. `has_one :through`
5. `has_many :through`
6. `polymorphic association`

---

##  Polymorphic Association

### What is a Polymorphic Association?

A polymorphic association allows **a single model to belong to multiple models**.

 One table acts as a **child for multiple parent tables**.

---

### Required Columns

A polymorphic table must contain **two columns**:

1. `record_type` – stores the parent model name
2. `record_id` – stores the parent model’s primary key

---

### Example

Active Storage uses polymorphic associations:

* A file can belong to a **User**
* A **Product**
* A **Post**

---

##  Creating Associations Using Generate Commands (New Tables)

### Step 1️ Create Parent Model

```ruby
rails generate model User name:string email:string
rails db:migrate
```

---

### Step 2️ Create Child Model with Reference

```ruby
rails generate model Vendor name:string location:string user:references
rails db:migrate
```

### What `user:references` Does Automatically

* Adds a `user_id` column
* Creates a foreign key constraint
* Builds **SQL-level association**

---

##  SQL-Level Associations (Database Side)

After running migrations, Rails generates SQL relations.

---

### User Migration

```ruby
class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
```

---

### Vendor Migration

```ruby
class CreateVendors < ActiveRecord::Migration[8.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
```

---

###  Important Note (Corrected Explanation)

If you try to delete the **parent table (`users`) before the child table (`vendors`)**, you will get a **foreign key constraint error**.

 Always delete **child tables first**, then parent tables
 Or use `dependent: :destroy` in Rails models

---

##  Rails-Level Associations (Model Side)

After database setup, we must define associations **inside models** so Rails understands the relationship.

---

### Vendor Model

```ruby
class Vendor < ApplicationRecord
  belongs_to :user
end
```

**Meaning:**

* `vendors` table contains `user_id`
* Each vendor belongs to **one user**
* `belongs_to` is always written in **singular**

---

### User Model

```ruby
class User < ApplicationRecord
  has_one :vendor
end
```

**Meaning:**

* One user can have **only one vendor**
* User table does **not** store the foreign key

>  **Note (clarified):**
> Using `has_one :vendor` (singular) tells Rails that this is a **one-to-one relationship**.

---

##  How Rails Associations Help

With proper associations, Rails provides:

### Easy Data Access

```ruby
user.vendor
vendor.user
```

### Additional Benefits

* Automatic validations
* Cleaner & readable code
* Powerful query helpers
* Less SQL writing

---

##  Creating Associations for an Existing Table

### Generate Migration to Add Foreign Key

```ruby
rails generate migration AddProductToOrder product:references
```

---

### Generated Migration File

```ruby
class AddProductToOrders < ActiveRecord::Migration[8.1]
  def change
    add_reference :orders, :product, null: true, foreign_key: true
  end
end
```

**What this does:**

* Adds `product_id` column to `orders` table
* Creates SQL-level association

---

##  Rails-Level Association for Existing Tables

### Product Model

```ruby
class Product < ApplicationRecord
  has_many :orders
end
```

---

### Order Model

```ruby
class Order < ApplicationRecord
  belongs_to :product
end
```

>  **Note (corrected):**
> Using `has_many :orders` (plural) tells Rails this is a **one-to-many relationship**.

---

##  Useful Rails Association Methods

```ruby
User.create
User.insert_all([{},{},{}])

User.last.vendor.create
```

### Explanation

* `User.last.vendor.create`

  * Automatically sets `user_id`
  * Creates a vendor linked to `User.last`

#  Foreign Key Constraints in Rails (PostgreSQL)

This document explains **common foreign key errors** you may encounter in a Rails application and why they occur.

---

##  1. Dropping a Parent Table Before Child Table

###  Scenario

You attempt to drop a **parent table** while a **child table** still references it via a foreign key.

###  Command Example

```sql
DROP TABLE test1s;
```

###  Error

```
ERROR: cannot drop table test1s because other objects depend on it
DETAIL: constraint fk_rails_7b772ba554 on table test2s depends on table test1s
HINT: Use DROP ... CASCADE to drop the dependent objects too.
```

###  Explanation

* `test2s` has a **foreign key** (`test1_id`) referencing `test1s`
* PostgreSQL **prevents deleting the parent table** to maintain referential integrity

###  Correct Approaches

#### Option 1: Drop child table first

```bash
rails generate migration DropTest2s
rails db:migrate
```

#### Option 2: Use CASCADE (Not recommended in Rails)

```sql
DROP TABLE test1s CASCADE;
```

 This will also delete dependent constraints and objects.

---

##  2. Inserting an Invalid Foreign Key into Child Table

###  Scenario

You insert a foreign key value into a child table that **does not exist in the parent table**.

###  Command Example

```ruby
Test2.insert({ name: "uday", test1_id: 8 })
```

###  Error

```
PG::ForeignKeyViolation: ERROR: insert or update on table "test2s"
violates foreign key constraint "fk_rails_7b772ba554"
DETAIL: Key (test1_id)=(8) is not present in table "test1s".
```

###  Explanation

* `test1_id = 8` does **not exist** in `test1s`
* PostgreSQL blocks the insert to **protect data integrity**

###  Correct Solution

Ensure the parent record exists before inserting:

```ruby
Test1.create(id: 8, name: "parent_record")
Test2.create(name: "uday", test1_id: 8)
```

---

#  Day 20 – Many-to-Many Associations in Rails

Rails supports **many-to-many relationships** in **two standard ways**:

1. `has_and_belongs_to_many` (HABTM)
2. `has_many :through`

---

## 1️ `has_and_belongs_to_many` (HABTM)

This is the **simplest way** to create a many-to-many relationship.

###  Key Characteristics

* Stores **only foreign keys**
* No separate model for the join table
* Join table exists **only to connect two models**
* No validations, callbacks, or extra attributes
* Faster to set up, but **less flexible**

---

###  Example: Product ↔ Tag

#### Step 1: Create `Tag` Model

```bash
rails g model Tag name:string description:string
rails db:migrate
```

Generated migration:

```ruby
class CreateTags < ActiveRecord::Migration[8.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
```

---

#### Step 2: Create Join Table

```bash
rails generate migration CreateJoinTableProductsTags products tags
rails db:migrate
```

Generated migration:

```ruby
class CreateJoinTableProductsTags < ActiveRecord::Migration[8.1]
  def change
    create_join_table :products, :tags do |t|
      # t.index [:product_id, :tag_id]
      # t.index [:tag_id, :product_id]
    end
  end
end
```

Database table created:

```
products_tags
--------------
product_id | tag_id
```

---

#### Step 3: Define Associations

**Product model**

```ruby
class Product < ApplicationRecord
  has_and_belongs_to_many :tags
end
```

**Tag model**

```ruby
class Tag < ApplicationRecord
  has_and_belongs_to_many :products
end
```

---

###  Inserting Data into Join Table (Automatic)

```ruby
p1 = Product.second
p1.tags << Tag.last
```

 **What happens internally?**

* Rails automatically inserts a row into `products_tags`
* No manual SQL insert required

```
product_id | tag_id
2          | 5
```

This means **Product 2 is linked with Tag 5**.

---

###  Fetching Associated Data

```ruby
p1.tags.map(&:name)
p1.tags.pluck(:name)
```

These return **all tag names related to the product**.

---

## 2️ `has_many :through`

This is the **recommended approach** for most real-world applications.

###  Why use `has_many :through`?

* Supports **extra columns** in the join table
* Allows **validations, callbacks, and scopes**
* Business logic can live in the join model
* More flexible and scalable

---

###  Example: Product ↔ Offer via ProductOffer

#### Step 1: Create Offer Model

```bash
rails generate model Offer name:string description:string discount:string
rails db:migrate
```

---

#### Step 2: Create Join Model

```bash
rails generate model ProductOffer product:references offer:references
rails db:migrate
```

Generated migration:

```ruby
class CreateProductOffers < ActiveRecord::Migration[8.1]
  def change
    create_table :product_offers do |t|
      t.references :product, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
```

Database table:

```ruby
create_table "product_offers" do |t|
  t.bigint "product_id", null: false
  t.bigint "offer_id", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

---

###  Define Associations

**Product model**

```ruby
class Product < ApplicationRecord
  has_many :product_offers
  has_many :offers, through: :product_offers
end
```

**Offer model**

```ruby
class Offer < ApplicationRecord
  has_many :product_offers
  has_many :products, through: :product_offers
end
```

**Join model**

```ruby
class ProductOffer < ApplicationRecord
  belongs_to :product
  belongs_to :offer
end
```

---

##  HABTM vs has_many :through

| Category         | Aspect           | `has_many :through` | `has_and_belongs_to_many` |
| ---------------- | ---------------- | ------------------- | ------------------------- |
| **SIMILARITIES** | Relationship     | Many-to-many        | Many-to-many              |
|                  | Foreign keys     | Yes                 | Yes                       |
|                  | Join table       | Required            | Required                  |
|                  | Data access      | Bidirectional       | Bidirectional             |
| **DIFFERENCES**  | Join model       | Required            | Not required              |
|                  | Join table PK    | Has `id`            | No primary key            |
|                  | Extra attributes | Supported           |  Not supported           |
|                  | Validations      | Supported           |  Not supported           |
|                  | Callbacks        | Supported           |  Not supported           |
|                  | Business logic   | Can be added        |  Cannot be added         |
|                  | Flexibility      | High                | Low                       |

---

##  `dependent: :destroy`

###  What is `dependent: :destroy`?

When a **parent record is deleted**, Rails **automatically deletes all associated child records**.

---

###  Why use it?

* Keeps the database clean
* Prevents orphan records
* Maintains data consistency
* Avoids bugs and invalid references

---

###  Without `dependent: :destroy`

* Parent is deleted
* Child records remain
* Child records point to non-existent parent
* Causes errors and confusing data

---

###  Example: One-to-One Association

**User model**

```ruby
class User < ApplicationRecord
  has_one :vendor, dependent: :destroy
end
```

**Vendor model**

```ruby
class Vendor < ApplicationRecord
  belongs_to :user
end
```

---

###  Deleting User

```ruby
User.find(4).destroy
```

### What Rails Does Internally

1. Finds vendor associated with user
2. Deletes vendor first
3. Deletes user record

---
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
---

# Day 22 – Rails Associations (has_many :through)

## Introduction

The `has_many :through` association is used to implement a **many-to-many relationship** between two models using an intermediate **join model**.

This association involves:

* Two main models that need to be connected
* One join model that manages the relationship

### Example

* **Product** and **Offer** are the main models
* **Subscription** is the join model

The join model allows:

* Storing additional attributes (expiry date, status, etc.)
* Avoiding complex SQL joins
* Using convenient ActiveRecord helper methods

---

# Step 1 – Create the Join Model

Generate the join model using Rails generator:

```bash
rails generate model Subscription type:string exp_date:date active:boolean product:references offer:references
rails db:migrate
```

This will:

* Create the **subscriptions** table
* Add `product_id` and `offer_id` foreign keys
* Establish SQL-level relationships
* Allow storing extra attributes in the join table

---

# Step 2 – Define Rails Associations

## Product Model

```ruby
class Product < ApplicationRecord
  has_many :subscriptions
  has_many :offers, through: :subscriptions
end
```

## Offer Model

```ruby
class Offer < ApplicationRecord
  has_many :subscriptions
  has_many :products, through: :subscriptions
end
```

## Subscription Model

```ruby
class Subscription < ApplicationRecord
  belongs_to :product
  belongs_to :offer
end
```

### Advantages

These associations:

* Provide built-in ActiveRecord helper methods
* Eliminate the need for writing raw SQL joins
* Simplify CRUD operations
* Improve readability and maintainability

---

# Step 3 – Insert Data into Join Table

## Method 1 – Using Append Operator

```ruby
product1 = Product.last
offer1 = Offer.first
product1.offers << offer1
```

**Result**

* Automatically creates a subscription record
* Stores `product_id` and `offer_id`
* Other fields remain `NULL` unless specified

---

## Method 2 – Creating Records Through Association

```ruby
pro1 = Product.find(2)
pro1.offers.create(name: "Clearance Sale", discount: 50, status: true)
```

**Result**

* Creates a new offer
* Creates a corresponding subscription record
* Associates the offer with the product

---

# Step 4 – Useful Association Methods

```ruby
Product.find(2).offers.reload          # Reload association cache
Product.find(1).offer_ids              # Get offer IDs
Product.find(2).offers.empty?          # Check if empty
Product.find(1).offers.size            # Count offers
Product.find(1).offers.exists?(name: "festive")
Product.find(1).offers.find_by(name: "festive")

productObj.offers.create(attributes)
productObj.offers.delete(offerObj)
productObj.offers.clear
```

## Updating Join Table Attributes

```ruby
subscriptionObj.update(status: 'active', renewal_date: 1.month.from_now)

productObj.subscriptions.where(offer_id: 5)
                        .update_all(status: 'active')

productObj.subscriptions.each do |sub|
  sub.update(status: 'expired') if sub.end_date < Date.today
end
```

---

# Rollback Migrations

## Rollback Last Migration

```bash
rails db:rollback
```

## Rollback Multiple Migrations

```bash
rails db:rollback STEP=2
```

Rollback is used to undo database schema changes.

---

# Safe Way to Destroy a Model

To safely remove a model:

1. Roll back the migration (if recent)
2. Verify the schema version
3. Delete the migration file
4. Destroy the model

```bash
rails destroy model model_name
```

This prevents schema conflicts and migration errors.

---
# Task
# Library Management Application – Rails Associations

## Objective

Create a Rails application implementing all association types:

* One-to-One
* One-to-Many
* Many-to-Many (`has_many :through`)

In this application the following models are used:

* Book
* Customer
* Purchase
* Order
* Address

---

# 1. Many-to-Many Association

(Book ↔ Customer using Purchase)

A **Purchase** acts as the join model connecting **Book** and **Customer**.

## Book Model

```ruby
class Book < ApplicationRecord
  has_many :purchases
  has_many :customers, through: :purchases
end
```

## Customer Model

```ruby
class Customer < ApplicationRecord
  has_many :purchases
  has_many :books, through: :purchases
end
```

## Purchase Migration

```ruby
class CreatePurchases < ActiveRecord::Migration[8.1]
  def change
    create_table :purchases do |t|
      t.references :book, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
```

## Purchase Model

```ruby
class Purchase < ApplicationRecord
  belongs_to :book
  belongs_to :customer
  has_one :order
end
```

**Explanation**

* One book can be purchased by many customers
* One customer can purchase many books
* Purchase table manages the relationship

---

# 2. One-to-One Association

(Purchase ↔ Order)

Each purchase generates exactly **one order**.

## Order Model

```ruby
class Order < ApplicationRecord
  belongs_to :purchase
  has_many :addresses
end
```

**Explanation**

* One purchase has one order
* Order belongs to a single purchase

---

# 3. One-to-Many Association

(Order ↔ Address)

An order can contain multiple addresses.

## Address Model

```ruby
class Address < ApplicationRecord
  belongs_to :order
end
```

**Explanation**

* One order can have many addresses
* Each address belongs to one order

---



* **Many-to-Many** using `has_many :through`
* **One-to-One** using `has_one / belongs_to`
* **One-to-Many** using `has_many / belongs_to`


