require 'test_helper'

class MobjectsControllerTest < ActionController::TestCase
  setup do
    @mobject = mobjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mobjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mobject" do
    assert_difference('Mobject.count') do
      post :create, mobject: { status: @mobject.status }
    end

    assert_redirected_to mobject_path(assigns(:mobject))
  end

  test "should show mobject" do
    get :show, id: @mobject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mobject
    assert_response :success
  end

  test "should update mobject" do
    patch :update, id: @mobject, mobject: { status: @mobject.status }
    assert_redirected_to mobject_path(assigns(:mobject))
  end

  test "should destroy mobject" do
    assert_difference('Mobject.count', -1) do
      delete :destroy, id: @mobject
    end

    assert_redirected_to mobjects_path
  end
end
