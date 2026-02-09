class Marks
    def check_marks(marks)
        if marks>=40
            return "Pass"
        end
        return "Fail"
    end       
end
puts Marks.new.check_marks(40)
i = 0;
isactive = false
until isactive
    puts "Not active"
    i+=1;
    if(i==5)
        isactive = true
    end
end
i = 1;
while i<=5
    puts i;
    i+=1
end
x = 6
j= 1;
until j==x
    puts j
    j+=1
end
k=1
loop do  
    break if k==4;
    puts k;
    k+=1;
end