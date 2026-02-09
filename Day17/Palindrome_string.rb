class Palindrome_string
    def Palindrome(str)
        i = 0;
        j = str.length-1;
        k = str.length/2;
        while i<k do
            if(str[i]!=str[j])
                return false;
            end
            j-=1;
            i+=1;
        end 
        return true; 
    end
end

puts Palindrome_string.new.Palindrome("10101")

str = 'uday';
puts "hello" + str