# arr = []

# #for loop
# for i in 1..10 # i in 10 to 20 range
# puts i
# end


# #while loop
# i = 1
# while i<=5
#     puts "hi"
#     i+=1
# end


# #loop
# m = 1
# loop do
#     puts "hello"
#     break if m==5 
#     m+=1;
# end

#until
# j = 0
# until j<5 do
#     puts j
#     j+=1
# end


# #break
# # i= 7
# # loop do
# #     puts "hello"
# #     break if i==10 
# #     i+=1;
# # end

# # #next 
# # for k in 1..5
# #     next if k%2==0
# #     puts k
# # end

# #redo
# flag = true
# for x in 2..4
#     puts x
#     if x==2 && flag==true
#         flag = false
#         redo
#     end
# end
# loop do
#     aq = gets.chomp
#     break if aq==10
#     redo if aq!=5
# end

# Array methods
#each
#reject
#map
#all
#inject
#select 
arr = [1,2,3,4,5,6,7]
arr2  = arr.select{ |i| i%2==0 } # it filter the elements based on condition and it return an array

print arr2
puts
# each 

arr2.each do |i|
    puts i
end

#reject 

print arr.reject{|i| i%2==0} # it reject the elements based on condition and it return an array
puts
print arr.select!{|i| i>=3} # ! this symbol modifies the original array 
#all
puts
puts arr.all?{|n| n>=5} # if all elements statisfies the condition it will give true otherwise true
#any
puts arr.any?{|n| n>=5} # if any one element statisfies the condition it will give true otherwise false
#map 
num = [1,2,3,4,5,6]
num2 = num.map{|m| m*2}
print num
puts
print num2

# collect
# each
puts
print num.each{|i| i*2}
puts 
# collect
num3 = num.collect{|i| i*3}
print num3
puts 
print num

