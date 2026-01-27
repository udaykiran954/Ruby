puts "Enter the amount:"
amount = gets.chomp
amount = amount.to_i
a = amount
while amount>0
    case amount
    when 2000..a
        i = amount / 2000
        amount = amount%2000
        puts "2000 X #{i} = #{2000*i}"
    when 500..1999
       i = amount / 500
        amount = amount%500
        puts "500 X #{i} = #{500*i}"
    when 100..499
       i = amount / 100
        amount = amount%100
        puts "100 X #{i} = #{100*i}"
     when 50..99
       i = amount / 50
        amount = amount%50
        puts "50 X #{i} = #{50*i}"
    when 20..49
       i = amount / 20
        amount = amount%20
        puts "20 X #{i} = #{20*i}"
    when 10..19

        i = amount /10
        amount = amount%10
        puts "10 X #{i} = #{10*i}"
    when 5..9
        i = amount / 5
        amount = amount%5
        puts "5 X #{i} = #{5*i}"
    when 2..4
    i = amount / 2
    amount = amount%2
    puts "2 X #{i} = #{2*i}"
    when 1
    i = amount / 1
    amount = amount%1
    puts "1 X #{i} = #{1*i}"
    else
        puts "wrong input"
        break
    end
end


arr = [1,2,3,4,5,6,7,8]
arr2 = arr.select{|n| n%2==0}
print arr2
puts
arr3 = arr.reject{|n| n%2==0}
print arr3
puts
arr.each do |n|
    print n
end
puts
i=0
loop do
break if i==arr.length
print arr[i]
i+=1
end
puts
j = 0
until j==arr.length do
    print arr[j]
    j+=1
end
puts
for i in arr
    print i
end
puts
x = 0
while x<arr.length
    print arr[x]
    x+=1
end
puts
print arr.all?{|n| n>0}
puts 
print arr.any?{|n| n==0}
puts 

print arr.map{|n| n*2}
puts
print arr.collect{|n| n*3}
puts
arr.each{|n|  puts n*4}
arr.map! {|n| n+=5}
print arr
 unless true 
   puts "uday"
 else
    puts "nani"
 end







