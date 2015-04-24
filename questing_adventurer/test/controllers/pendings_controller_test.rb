require 'test_helper'

class PendingsControllerTest < ActionController::TestCase
  setup do
    @pending = pendings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pendings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pending" do
    assert_difference('Pending.count') do
      post :create, pending: { quest_id_id: @pending.quest_id_id, user_id_id: @pending.user_id_id }
    end

    assert_redirected_to pending_path(assigns(:pending))
  end

  test "should show pending" do
    get :show, id: @pending
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pending
    assert_response :success
  end

  test "should update pending" do
    patch :update, id: @pending, pending: { quest_id_id: @pending.quest_id_id, user_id_id: @pending.user_id_id }
    assert_redirected_to pending_path(assigns(:pending))
  end

  test "should destroy pending" do
    assert_difference('Pending.count', -1) do
      delete :destroy, id: @pending
    end

    assert_redirected_to pendings_path
  end
end
