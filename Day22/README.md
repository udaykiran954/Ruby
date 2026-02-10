
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


