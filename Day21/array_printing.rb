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
name = "rails"
puts name.capitalize

[10,20,30].each do |e|
    print "#{e} "
end
puts
arr = [1,2,3,4].map{|e| e*2}
print arr
puts 
arr = [1,2,3,4,5,6].select{|e| e%2==0}
print arr
puts 
arr = [5,10,15]
sum = 0;

arr.each do |e|
sum+=e;
end
puts sum

puts [1, 3, 5, 6].any?{|e|e%2==0}
puts [2, 4, 6].all?{|e|e%2==0}