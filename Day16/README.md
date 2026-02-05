#  Day 16 – Action Mailbox

## 🔹 What is Action Mailbox?

**Action Mailbox** allows Rails to **receive and process incoming emails**.

 Unlike Action Mailer, it must be **explicitly installed**.

---

## 🔹 Step 1: Install Action Mailbox

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

## 🔹 Step 2: Generate a Mailbox

```ruby
rails generate mailbox Support
```

### Files Generated

```
app/mailboxes/support_mailbox.rb
test/mailboxes/support_mailbox_test.rb
```

>  `rails generate action_mailer support` is incorrect
> ✔ Correct command is `rails generate mailbox Support`

---

## 🔹 Step 3: Configure Routing

 `app/mailboxes/application_mailbox.rb`

```ruby
class ApplicationMailbox < ActionMailbox::Base
  routing all: :support
end
```

 All incoming emails go to `SupportMailbox`

---

## 🔹 Step 4: Configure Production Ingress

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