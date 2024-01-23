require "test_helper"

class ProductTest < ActiveSupport::TestCase

  test "should save valid product" do
    product = Product.new(name: "product")
    assert product.save
  end

  test "should not save product without name" do
    product = Product.new()
    assert_not product.save
  end
end
