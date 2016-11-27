require 'test_helper'

class MdetailsControllerTest < ActionController::TestCase
  setup do
    @mdetail = mdetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mdetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mdetail" do
    assert_difference('Mdetail.count') do
      post :create, mdetail: { status: @mdetail.status }
    end

    assert_redirected_to mdetail_path(assigns(:mdetail))
  end

  test "should show mdetail" do
    get :show, id: @mdetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mdetail
    assert_response :success
  end

  test "should update mdetail" do
    patch :update, id: @mdetail, mdetail: { status: @mdetail.status }
    assert_redirected_to mdetail_path(assigns(:mdetail))
  end

  test "should destroy mdetail" do
    assert_difference('Mdetail.count', -1) do
      delete :destroy, id: @mdetail
    end

    assert_redirected_to mdetails_path
  end
end
