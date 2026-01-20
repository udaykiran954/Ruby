class Employee
    def initialize(company_name,empid)
        @company_name = company_name
        @employee_id = empid
    end
    def info
        "[Company_name: #{@company_name}"+"\nEmployee_id:#{@employee_id}"+"\n"
    end
 end

class Developer < Employee
    def initialize(company_name,empid,name,age,package)
        super(company_name,empid)
        @name = name
        @age = age
        @package = package
    end
    def info
        super + "Name: #{@name} \nAge: #{@age} \nPackage: #{@package}]"
    end
end

dev1 = Developer.new("DaySpring_techonologies","1001","uday",22,4)
puts dev1.info