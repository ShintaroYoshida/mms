require 'test_helper'

class MinutesControllerTest < ActionController::TestCase
  setup do
    @minute = minutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:minutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create minute" do
    assert_difference('Minute.count') do
      post :create, minute: { detail: @minute.detail, meeting_id: @minute.meeting_id }
    end

    assert_redirected_to minute_path(assigns(:minute))
  end

  test "should show minute" do
    get :show, id: @minute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @minute
    assert_response :success
  end

  test "should update minute" do
    put :update, id: @minute, minute: { detail: @minute.detail, meeting_id: @minute.meeting_id }
    assert_redirected_to minute_path(assigns(:minute))
  end

  test "should destroy minute" do
    assert_difference('Minute.count', -1) do
      delete :destroy, id: @minute
    end

    assert_redirected_to minutes_path
  end
end
