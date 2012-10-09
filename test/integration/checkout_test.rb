require 'test_helper'

class CheckoutTest < ActionDispatch::IntegrationTest
  fixtures :all
  
  test "first checkout test" do
    checkout = Checkout.new(Rule.all)
    checkout.scan(products(:FR1))
    checkout.scan(products(:SR1))
    checkout.scan(products(:FR1))
    checkout.scan(products(:FR1))
    checkout.scan(products(:CF1))
    assert_equal(22.45, checkout.total)
  end
  
  test "second checkout test" do
    checkout = Checkout.new(Rule.all)
    checkout.scan(products(:FR1))
    checkout.scan(products(:FR1))
    assert_equal(3.11, checkout.total)
  end
  
  test "third checkout test" do
    checkout = Checkout.new(Rule.all)
    checkout.scan(products(:SR1))
    checkout.scan(products(:SR1))    
    checkout.scan(products(:FR1))
    checkout.scan(products(:SR1))
    assert_equal(16.61, checkout.total)
  end
end
