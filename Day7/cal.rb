class Base
    def operation(n1,n2)
        "sum is #{n1+n2}"
    end
end

class Child<Base
    def operation(n1,n2)
        puts super(n1,n2)
        "product is #{n1*n2}"
    end
end

c = Child.new
puts c.operation(10,20)
