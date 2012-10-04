class Rule < ActiveRecord::Base
  attr_accessible :id, :name
  validates :name, :presence => true
   
  def apply_discount(products)
    if respond_to? name
      return send(name, products)
    end    
  end
  
  def buy_one_get_one_free(products)
    counter = 0
    products.each do |product|   
      if (product.rule_id == id)
	counter += 1
	if (counter % 2 == 0)
	  product.price = 0
	end
      end
    end

    return products
  end
  
  def bulk_purchase(products)
    products.each do |product|    
      if (product.rule_id == id)
	if (products.count {|p| p.code == product.code}) >= 3
	  product.price = product.price * 0.9
	end
      end
    end
    
    return products
  end
end
