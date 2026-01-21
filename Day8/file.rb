 #conditional statements

stock = 20
is_available = false
if stock > 0
    is_available = true
else
    puts "Item not available"
end

puts is_available

# Ternary statements
is_active = true
a = (is_active)? "present": "not present"
puts a

# else if

price = 500
discount = 0

if price>=100 && price<200
    discount  = 10
elsif price>=200 && price<300
     discount = 20
elsif price>=300 && price<400
    discount = 30
elsif price>=400 && price<500
    discount = 40
elsif price>=500 && price<600
    discount = 50
else 
    discount = 5

puts discount
 

#case
case 
when 100..200
    discount = 10
when 201..300
    discount = 20
when 301..400
    discount = 30
when 401..500
    discount = 40
when 500..600
    discount = 50
else 
    discount = 5
end

puts discount

#unless
email = true
unless email
    puts "email unavailable"
else
    puts "email available"
end



