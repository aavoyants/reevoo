class Checkout
  attr_accessor :total, :rules, :products

  def initialize(pricing_rules = [])
    @products = [] 
    @total = 0.00
    @pricing_rules = pricing_rules
  end
   
  def scan(product)
    @products << product.dup
  end
   
  def total    
    if !@products.empty?
      if !@pricing_rules.empty?
	@pricing_rules.each { |rule| rule.apply_discount(@products) }
      end
      @products.each {|product| @total += product.price}
    end 
    
    return @total
  end
end