require 'test_helper'

class MadvisorsControllerTest < ActionController::TestCase
  setup do
    @madvisor = madvisors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:madvisors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create madvisor" do
    assert_difference('Madvisor.count') do
      post :create, madvisor: { status: @madvisor.status }
    end

    assert_redirected_to madvisor_path(assigns(:madvisor))
  end

  test "should show madvisor" do
    get :show, id: @madvisor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @madvisor
    assert_response :success
  end

  test "should update madvisor" do
    patch :update, id: @madvisor, madvisor: { status: @madvisor.status }
    assert_redirected_to madvisor_path(assigns(:madvisor))
  end

  test "should destroy madvisor" do
    assert_difference('Madvisor.count', -1) do
      delete :destroy, id: @madvisor
    end

    assert_redirected_to madvisors_path
  end
end
