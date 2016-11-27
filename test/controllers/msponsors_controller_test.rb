require 'test_helper'

class MsponsorsControllerTest < ActionController::TestCase
  setup do
    @msponsor = msponsors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:msponsors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create msponsor" do
    assert_difference('Msponsor.count') do
      post :create, msponsor: { status: @msponsor.status }
    end

    assert_redirected_to msponsor_path(assigns(:msponsor))
  end

  test "should show msponsor" do
    get :show, id: @msponsor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @msponsor
    assert_response :success
  end

  test "should update msponsor" do
    patch :update, id: @msponsor, msponsor: { status: @msponsor.status }
    assert_redirected_to msponsor_path(assigns(:msponsor))
  end

  test "should destroy msponsor" do
    assert_difference('Msponsor.count', -1) do
      delete :destroy, id: @msponsor
    end

    assert_redirected_to msponsors_path
  end
end
