class Reverse_string
    def reverse(str)
        str.reverse
    end
end
puts Reverse_string.new.reverse("uday");
puts "uday".length

str1 = "";
str2 = "uday"
i = str2.length-1
until i<0 do
    str1+=str2[i];
    i-=1;
end
puts str1;


