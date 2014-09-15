require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    sign_in admins(:one)
    get :new
    assert_response :success
  end

  test "should create product" do
    sign_in admins(:one)
    assert_difference('Product.count') do
      post :create, :product => { :descriptionL => @product.descriptionL, :descriptionS => @product.descriptionS, :price => @product.price, :stock => @product.stock, :weight=> @product.weight }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, :id => @product
    assert_response :success
  end

  test "should get edit" do
    sign_in admins(:one)
    get :edit, :id => @product
    assert_response :success
  end

  test "should update product" do
    sign_in admins(:one)
    put :update, :id => @product, :product => { :descriptionL => @product.descriptionL, :descriptionS => @product.descriptionS, :price => @product.price, :stock => @product.stock, :weight=> @product.weight }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    sign_in admins(:one)
    assert_difference('Product.count', -1) do
      delete :destroy, :id => @product
    end

    assert_redirected_to products_path
  end
end
