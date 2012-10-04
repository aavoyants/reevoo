class Checkout
  attr_accessor :total, :rules, :products

  def initialize(curr_rule)
    @products = [] 
    @total = 0.00
    @curr_rule = curr_rule
  end
   
  def scan(product)
    @products << product.dup
  end
   
  def total    
    if !@products.empty?
      if !(@curr_rule == nil)
	@curr_rule.apply_discount(@products)
      end
      @products.each {|product| @total += product.price}
    end 
    
    return @total
  end
end
