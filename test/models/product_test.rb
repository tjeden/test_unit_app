require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "title can't be blank" do
    product = Product.new(price: 19.99, description: "Good book")
    assert_equal false, product.save, "Saved with blank title"
    assert product.errors.messages[:title], "No errors on title"
  end

  test "price can't be blank" do
    product = Product.new(title: "Ogniem i Mieczem", description: "Good book")
    assert_equal false, product.save, "Saved with blank price"
    assert product.errors.messages[:price], "No errors on price"
  end

  test "description can't be blank" do
    product = Product.new(title: "Ogniem i Mieczem", price: 19.99)
    assert_equal false, product.save, "Saved with blank description"
    assert product.errors.messages[:description], "No errors on description"
  end

  test "can save a product with valid attributes" do
    product = Product.new(title: "Ogniem i Mieczem", price: 19.99, description: "Good book") 
    assert_equal true, product.save, "Wasn't saved"
  end

  test "title must have at least 4 characters" do
    product = Product.new(title: "ABC", price: 19.99, description: "Good book")
    assert_equal false, product.save, "Saved with too short title"
    assert product.errors.messages[:title], "No errors on title"
  end

  test "price must be between 0.01 and 100" do
    product = Product.new(title: "Ogniem i Mieczem", price: 0, description: "Good book")
    assert_equal false, product.save, "Saved with price 0"
    assert product.errors.messages[:price], "No errors on price"
    product.price = 101
    assert_equal false, product.save, "Saved with price 101"
    assert product.errors.messages[:price], "No errors on price"
  end

  test "title must be unique" do
    title = products(:paragraf_22).title
    duplicate = Product.new(title: title, price: 100, description: "Good Book")
    assert_equal false, duplicate.save, "Saved with the same name"
    assert duplicate.errors.messages[:title], "No errors on title"
  end

  test "product can be deleted" do
    assert_difference("Product.count", -1) do
      products(:paragraf_22).delete
    end
  end
end
