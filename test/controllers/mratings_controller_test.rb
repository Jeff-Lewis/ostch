require 'test_helper'

class MratingsControllerTest < ActionController::TestCase
  setup do
    @mrating = mratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mrating" do
    assert_difference('Mrating.count') do
      post :create, mrating: { status: @mrating.status }
    end

    assert_redirected_to mrating_path(assigns(:mrating))
  end

  test "should show mrating" do
    get :show, id: @mrating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mrating
    assert_response :success
  end

  test "should update mrating" do
    patch :update, id: @mrating, mrating: { status: @mrating.status }
    assert_redirected_to mrating_path(assigns(:mrating))
  end

  test "should destroy mrating" do
    assert_difference('Mrating.count', -1) do
      delete :destroy, id: @mrating
    end

    assert_redirected_to mratings_path
  end
end
