#  Day 23 – Rails Associations & Migrations

---

#  ActiveRecord Associations in Rails

Rails provides different types of associations to manage relationships between models.

| Association               | Description                                                    |
| ------------------------- | -------------------------------------------------------------- |
| `has_one`                 | Used for one-to-one relationship                               |
| `has_one :through`        | Strict one-to-one relationship through another model           |
| `has_many`                | Used for one-to-many relationship                              |
| `has_many :through`       | Many-to-many relationship using a join model                   |
| `has_and_belongs_to_many` | Many-to-many without a join model                              |
| `belongs_to`              | Used on the foreign key side (makes association bidirectional) |

---

#  Rails Migrations

Migrations are used to make changes in the database structure.

They help in:

* Creating tables
* Adding columns
* Removing columns
* Adding references (foreign keys)
* Renaming tables/columns
* Modifying data types
* Dropping tables

---

#  Migration Naming Rules

When writing migration names:

* First word should be a **Verb**

  * Create
  * Add
  * Remove
  * Rename
  * Drop
  * Modify / Change

* Second word should be a **Noun**

  * Table name
  * Column name

Example:

```
CreateUsers
AddPhoneNumberToUsers
RemoveDescriptionFromVlogs
RenameNameToUserNameInUsers
```

---

#  Creating a Table

```bash
rails generate migration CreateUsers name:string
rails db:migrate
```

Generated file:

```ruby
class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
  end
end
```

---

#  Adding Reference (Foreign Key)

```bash
rails generate migration AddUserReferenceToVlogs user:references
rails db:migrate
```

Generated migration:

```ruby
class AddUserReferenceToVlogs < ActiveRecord::Migration[8.1]
  def change
    add_reference :vlogs, :user, null: false, foreign_key: true
  end
end
```

Adds:

* `user_id`
* Index
* Foreign key constraint

---

#  Adding a Column

```bash
rails generate migration AddPhoneNumberToUsers phone_number:string
rails db:migrate
```

---

#  Removing a Column

```bash
rails generate migration RemoveDescriptionFromVlogs description:string
rails db:migrate
```

Generated:

```ruby
remove_column :vlogs, :description, :string
```

---

#  Renaming a Column

```bash
rails generate migration RenameNameToUserNameInUsers
```

Generated migration file will be **empty**:

```ruby
class RenameNameToUserNameInUsers < ActiveRecord::Migration[8.1]
  def change
  end
end
```

 **Important Note:**

> For renaming and modifying columns, Rails does NOT generate the method automatically.
> It creates an empty migration file.
> We must manually write the required method inside `def change`, then run `rails db:migrate`.

Now modify it:

```ruby
def change
  rename_column :users, :name, :user_name
end
```

Then run:

```bash
rails db:migrate
```

---

#  Modifying Column Data Type

Example: Change `phone_number` from integer to string.

```bash
rails generate migration ChangePhoneNumberTypeInUsers
```

Generated file (empty):

```ruby
class ChangePhoneNumberTypeInUsers < ActiveRecord::Migration[8.1]
  def change
  end
end
```

 Again, Rails will NOT auto-generate the method.

Manually write:

```ruby
def change
  change_column :users, :phone_number, :string
end
```

Then run:

```bash
rails db:migrate
```

---

#  Renaming a Table

```bash
rails generate migration RenameCustomersToUsers
```

Edit migration:

```ruby
def change
  rename_table :customers, :users
end
```

---

#  Dropping a Table

```bash
rails generate migration DropUsers
```

Edit file:

```ruby
def change
  drop_table :users
end
```

---

#  Rails DB Commands 

### 1️⃣ `rails db:migrate`

* Runs all pending migrations
* Applies database changes
* Updates `schema.rb`

---

### 2️⃣ `rails db:rollback`

* Reverts the last migration
* Undo recent database change

Example:

```bash
rails db:rollback
```

Rollback multiple steps:

```bash
rails db:rollback STEP=2
```

---

### 3️⃣ `rails db:migrate:redo`

* Rollback + migrate again
* Useful when testing a migration

```bash
rails db:migrate:redo
```

Redo multiple:

```bash
rails db:migrate:redo STEP=2
```

---

### 4️⃣ `rails db:reset`

* Drops database
* Creates database
* Runs migrations
* Runs seeds

 Deletes all data

---

### 5️⃣ `rails db:seed`

* Runs `db/seeds.rb`
* Used to insert default/sample data

---


#  Ruby Methods

### `uniq` (Array)

```ruby
[1,2,3,1,2,3].uniq
```

Output:

```
[1,2,3]
```

---

### `chars` (String)

```ruby
"uday".chars
```

Output:

```
["u","d","a","y"]
```

---

#  Rails Data Types

### String Types

* string
* text
* binary

### Numeric Types

* integer
* float
* decimal

### Date & Time Types

* date
* datetime
* timestamp
* time
---
