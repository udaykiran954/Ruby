class Factorial
    def fac(n)
        f = 1;
        i = 1;
        while i<=n do
            f*=i;
            i+=1;
        end
        f;
    end
end
puts Factorial.new.fac(4);