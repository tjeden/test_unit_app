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
    assert_difference("Product.count", 1) do
      post :create, product: {title: "Ojciec chrzestny", price:49, description: "Mario Puzo"}
    end
    assert_equal "Ojciec chrzestny", assigns(:product).title
    assert_equal 49, assigns(:product).price
    assert_equal "Mario Puzo",  assigns(:product).description
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
end
