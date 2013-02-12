require 'test_helper'

class BasketItemsControllerTest < ActionController::TestCase
  setup do
    @basket_item = basket_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basket_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basket_item" do
    assert_difference('BasketItem.count') do
      post :create, basket_item: { price: @basket_item.price, productId: @basket_item.productId, quantity: @basket_item.quantity, sessionId: @basket_item.sessionId }
    end

    assert_redirected_to basket_item_path(assigns(:basket_item))
  end

  test "should show basket_item" do
    get :show, id: @basket_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basket_item
    assert_response :success
  end

  test "should update basket_item" do
    put :update, id: @basket_item, basket_item: { price: @basket_item.price, productId: @basket_item.productId, quantity: @basket_item.quantity, sessionId: @basket_item.sessionId }
    assert_redirected_to basket_item_path(assigns(:basket_item))
  end

  test "should destroy basket_item" do
    assert_difference('BasketItem.count', -1) do
      delete :destroy, id: @basket_item
    end

    assert_redirected_to basket_items_path
  end
end
