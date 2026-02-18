# anonymous methods using blocks
def simple_method
    yield
    yield
end
simple_method{puts "hello all"}
simple_method{puts "multiple yield"}
def simple_method1
    yield "uday","nani"
end
simple_method1 do |*args|
    puts args
    args.each do |p| puts "Student is #{p}"  
    end
end
def method1
    yield "uday","ruby"
    yield 
end
method1 do |*args|
    args.each_cons(2) do |a,b|
        puts "name is #{a} course is #{b}"
    end
end
method1 do |*args|
    args.each_with_index do |a,b|
        puts "name is #{a} course is #{b}"
    end
end
def m1
    yield
    yield
end
# m1 {puts "hii"} {puts "hii2"} #error 

# Procs
p = Proc.new{puts "proc hii hello"} # generating the proc
p.call #Calling proc
p1 = Proc.new{|a| puts "hello #{a}"} # generate a parameterize Proc
p1.call("uday")
p2 = Proc.new{|a| puts "hello #{a}"}
p2.call # if we not pass any arguments it will accept the nil value
p3 = Proc.new{|a,b| puts "values are #{a}, #{b}"} # passing multiple parameters
p3.call(10,20) 

def demo(proc) # passing a Proc parameter
    proc.call
end
demo(Proc.new{puts "hello proc"})
def demo2(proc1,proc2,proc3,proc4) # passing multiple Proc parameters
    proc1.call
    proc2.call
    proc3.call
    proc4.call
end
pr1 = Proc.new{puts "first proc"}
pr2 = Proc.new{puts "second proc"}
pr3 = Proc.new{puts "third proc"}
pr4 = Proc.new{puts "fourth proc"} 
demo2(pr1,pr2,pr3,pr4)

def demo3
    a1 = Proc.new{return "proc inside the method"}
    a1.call
    "this is returned from method"
end
puts demo3 # output is only proc inside the method and it will exit from the method

#Lamdas
l = ->{"hello lambdas"} # -> lambda operator
puts l.call
# paramaterized lambda
p1 = ->(a){puts "value of a is #{a}"}
p1.call(10)
# p1.call #it argument error
# proc will considered it as nil if we not pass an argument but lambda will throw an argument error
def demo_lambda 
    l1 = -> {return "hello"}
    puts l1.call
    "hello uday"
end
puts demo_lambda # output is hello hello uday because it will not exit from the method it will exits only lambda call

# lambda are useful to write scopes in rails
# lamda and proc are objects but block is not an object
