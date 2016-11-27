require 'test_helper'

class MstatsControllerTest < ActionController::TestCase
  setup do
    @mstat = mstats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mstats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mstat" do
    assert_difference('Mstat.count') do
      post :create, mstat: { status: @mstat.status }
    end

    assert_redirected_to mstat_path(assigns(:mstat))
  end

  test "should show mstat" do
    get :show, id: @mstat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mstat
    assert_response :success
  end

  test "should update mstat" do
    patch :update, id: @mstat, mstat: { status: @mstat.status }
    assert_redirected_to mstat_path(assigns(:mstat))
  end

  test "should destroy mstat" do
    assert_difference('Mstat.count', -1) do
      delete :destroy, id: @mstat
    end

    assert_redirected_to mstats_path
  end
end
