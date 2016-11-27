require 'test_helper'

class McategoriesControllerTest < ActionController::TestCase
  setup do
    @mcategory = mcategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mcategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mcategory" do
    assert_difference('Mcategory.count') do
      post :create, mcategory: { status: @mcategory.status }
    end

    assert_redirected_to mcategory_path(assigns(:mcategory))
  end

  test "should show mcategory" do
    get :show, id: @mcategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mcategory
    assert_response :success
  end

  test "should update mcategory" do
    patch :update, id: @mcategory, mcategory: { status: @mcategory.status }
    assert_redirected_to mcategory_path(assigns(:mcategory))
  end

  test "should destroy mcategory" do
    assert_difference('Mcategory.count', -1) do
      delete :destroy, id: @mcategory
    end

    assert_redirected_to mcategories_path
  end
end
