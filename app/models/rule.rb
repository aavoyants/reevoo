class Rule < ActiveRecord::Base
  attr_accessible :id, :name
  validates :name, :presence => true
  
  def apply_discount(products)
    case self.id
    when 1
      buy_one_get_one_free(products)
    when 2
      bulk_purchase(products)
    end   
  end
  
  def buy_one_get_one_free(products)
    counter = 0
    products.each do |product|   
      if (product.rule_id == self.id)
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
      if (product.rule_id == self.id)
	if (products.count {|p| p.code == product.code}) >= 3
	  product.price = product.price * 0.9
	end
      end
    end
    
    return products
  end
end
