class Dem 
    attr_accessor :id, :name, :age
    @@company = "DaySpring Technologies";

    def initialize(id,name,age)
        @id = id
        @name = name
        @age = age
    end

    def getId()
        return @id
    end

    def setId(id)
        @id = id
    end


    def getName()
        return @name
    end

    def setName(name)
        @name = name
    end

    def getAge()
        return @age
    end

    def setAge(age)
        @age = age
    end

    def toString()
        return "[Id: #{@id}"+"\n"+"name: "+@name+"\nAge: #{@age} \nCompany: #{@@company} ]";
    end
end

d = Dem.new(10,"uday",20)
puts d.toString()
str = "uday";
str2 = "uday";
puts str.size();
puts str.length;
puts str[0,3];
puts str.include?"da";
puts str.concat(" hello");

arr = [];
puts arr.push(10);
arr1 = Array.new(3);
 arr1.push("uday");
 arr1.push("nani");
arr1.push("ammulu");
puts arr1.length
puts arr1;
arr1.push("10");
puts arr1;
puts arr1.length






