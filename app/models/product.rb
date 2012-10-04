class Product < ActiveRecord::Base
  attr_accessible :id, :name, :code, :price, :rule_id
  
  validates :code,  :presence => true, :uniqueness => true
  validates :name,  :presence => true
  validates :price, :presence => true, numericality: {greater_than_or_equal_to: 0.01}
end
