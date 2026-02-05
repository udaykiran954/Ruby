#  Day 19 – Associations in Ruby on Rails

Associations in Rails define **relationships between models (tables)**.
They help **ActiveRecord** understand how records are connected and allow **easy data access** without writing complex SQL queries.

### Example

A **User** can have:

* one **Vendor**
* many **Posts**
* many **Orders**

---

## 🔹 Types of Associations (Conceptual Level)

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

>  *This is the reverse of one-to-many and is implemented using `belongs_to`.*

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

✔ Always delete **child tables first**, then parent tables
✔ Or use `dependent: :destroy` in Rails models

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

---



    
           
           

          






