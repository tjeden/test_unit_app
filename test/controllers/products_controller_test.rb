require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "get some product" do
    get :show, id: products(:paragraf_22).id
    assert_response :success
    assert_equal products(:paragraf_22), assigns(:product)
    assert_template :show
  end

  test "get index of products" do
    get :index
    assert_response :success
    assert_template :index
    assert_equal Product.all, assigns(:products)
  end

  test "delete one product" do
    assert_difference("Product.count", -1) do
      delete :destroy, id: products(:paragraf_22).id
    end
    assert_response :redirect
    assert_redirected_to products_path
  end

  test "new shows form" do
    get :new
    assert_response :success
    assert_template :new
    assert assigns(:product)
  end

  test "create new product" do
    attributes = FactoryGirl.attributes_for(:product)
    assert_difference("Product.count", 1) do
      post :create, product: attributes
    end
    assert_equal attributes[:title], assigns(:product).title
    assert_equal attributes[:price], assigns(:product).price
    assert_equal attributes[:description],  assigns(:product).description
    assert_response :redirect
    assert_redirected_to products_path
  end

  test "create new product with invalid title" do
    assert_no_difference("Product.count") do
      post :create, product: {price: 49, description: "Mario Puzo"}
    end
    assert_response :success
    assert_template :new
  end

  test "show edit form" do
    get :edit, id: products(:paragraf_22).id
    assert_response :success
    assert_template :edit
    assert_equal products(:paragraf_22), assigns(:product)
  end

  test "update product" do
    attributes = FactoryGirl.attributes_for(:product)
    patch :update, id: products(:paragraf_22).id, product: attributes

    product = Product.find(products(:paragraf_22).id)
    assert_equal attributes[:title], product.title
    assert_equal attributes[:price], product.price
    assert_equal attributes[:description], product.description
    assert_response :redirect
    assert_redirected_to products_path
  end

  test "update products with invalid attributes" do
    patch :update, id: products(:paragraf_22).id, product: { title: "A", price: 12, description: "OK"}
    product = Product.find(products(:paragraf_22).id)
    assert_not_equal "A", product.title
    assert_not_equal 12, product.price
    assert_not_equal "OK", product.description
    assert_response :success
    assert_template :edit
  end
end
