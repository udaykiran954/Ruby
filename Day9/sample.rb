class SampleMom
  def my_public_parent
    p "from public parent"
  end
  private
  def my_private_parent
    p "from private parent"
  end
  protected
  def my_protected_parent
    p "from protected parent"
  end
end
class Sample < SampleMom
  def my_public
    my_prv
    self.my_private_parent     
    self.my_protected_parent 
    p "this is from public method inchild class"
  end
  def my_public_with(alien_obj)
    puts "This is simple public method passing on another object"
    #alien_obj.my_private_parent
    #alien_obj.private_msg #notice the difference in private and protected here
    alien_obj.my_protected_parent 
  end
  
  private
  def my_prv
    p "from private child"
  end
end
sample1 = Sample.new
sample2 = Sample.new
sample1.my_public #simple public method call 
sample1.my_public_with(sample2)

#sample1.my_public_with(sample2) #calling protected parent class method from child
