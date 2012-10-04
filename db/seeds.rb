# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Rule.delete_all
Rule.create(:id => 1,:name => 'buy_one_get_one_free')
Rule.create(:id => 2,:name => 'bulk_purchase')

Product.delete_all
Product.create(:code => 'FR1', :name => 'Fruit tea',    :price => '3.11', :rule_id => 1)
Product.create(:code => 'SR1', :name => 'Strawberries', :price => '5.00', :rule_id => 2)
Product.create(:code => 'CF1', :name => 'Coffee',       :price => '11.23')