class User
    attr_accessor :role
    # def admin?
    #     role=="admin"
    # end
    # def guest?
    #     role=="guest"
    # end
    # def member?
    #     role=="member"
    # end
    # define_method
    ["admin","guest","member"].each do |role_name|
    define_method ("#{role_name}?")do
        puts role == role_name
    end
end
# method missing
def method_missing(method_name,*args)
puts "method is trying to call is not present"
end
end
u1 = User.new
u1.role = "member"
puts u1.member?
puts u1.m1?

class Vendor
    def method_missing(method_name,*args)
      if method_name.to_s.start_with?("find_by")
        str = method_name.to_s.sub("find_by_","")
        puts str
        puts "find_by_#{str}: #{args.first}"
      end
    end
end
v1 = Vendor.new
puts v1.find_by_name("uday");

#monkey patching
class String
    def upcase
        "upcase overwritten"
    end
    def custom_downcase
        downcase
    end
end

str = "uday"
puts str.upcase
puts "UDAY".custom_downcase

# BasicObject.send(:methodname)

class Messanger
    def email(msg)
        "messaged #{msg} through email"
    end
    def sms(msg)
        "messaged #{msg} through sms"
    end
    def telegram(msg)
        "messaged #{msg} through telegrama"
    end
    private 
    def m2
        "private method"
    end
end 
m1 = Messanger.new
method_name = :email
puts m1.send(method_name,"hii")
puts m1.send(:m2)
puts m1.__send__(:m2)
puts m1.methods
puts m1.inspect
puts m1.class
puts "u".class
# class_eval for all class methods
# instance_eval for all instances

class Simple
    Simple.class_eval do
        def m1
        "class eval method"
    end
    end  
    Simple.instance_eval do
        def m2
        "instance eval method"
    end
    end 
end

puts Simple.new.m1
puts Simple.m2
