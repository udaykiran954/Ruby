
#  Day 17 – Namespaced Models & Active Record Methods

## 🔹 Creating a Namespaced Model

```ruby
rails generate migration Product::Category
rails db:migrate
```

### Result

* Creates a `categories` table
* Model path: `Product::Category`

---

## 🔹 Adding Columns to Namespaced Model

```ruby
rails generate migration AddCategoryNameToProductCategory category_name:string
rails db:migrate
```

---

## 🔹 Active Record Insert Methods

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

## 🔹 Finding Records

```ruby
Model.find(id)        # raises exception if not found
Model.find_by(id: id) # returns nil if not found
```

---

## 🔹 Fetching Records by Position

```ruby
Model.first
Model.second
Model.third
Model.fourth
Model.fifth
Model.last
```