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

