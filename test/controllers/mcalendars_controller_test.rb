require 'test_helper'

class McalendarsControllerTest < ActionController::TestCase
  setup do
    @mcalendar = mcalendars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mcalendars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mcalendar" do
    assert_difference('Mcalendar.count') do
      post :create, mcalendar: { status: @mcalendar.status }
    end

    assert_redirected_to mcalendar_path(assigns(:mcalendar))
  end

  test "should show mcalendar" do
    get :show, id: @mcalendar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mcalendar
    assert_response :success
  end

  test "should update mcalendar" do
    patch :update, id: @mcalendar, mcalendar: { status: @mcalendar.status }
    assert_redirected_to mcalendar_path(assigns(:mcalendar))
  end

  test "should destroy mcalendar" do
    assert_difference('Mcalendar.count', -1) do
      delete :destroy, id: @mcalendar
    end

    assert_redirected_to mcalendars_path
  end
end
