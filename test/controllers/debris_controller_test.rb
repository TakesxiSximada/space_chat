require 'test_helper'

class DebrisControllerTest < ActionController::TestCase
  setup do
    @debri = debris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create debri" do
    assert_difference('Debri.count') do
      post :create, debri: { angle: @debri.angle, deleted: @debri.deleted, height: @debri.height, object_type_id: @debri.object_type_id, size: @debri.size, word: @debri.word }
    end

    assert_redirected_to debri_path(assigns(:debri))
  end

  test "should show debri" do
    get :show, id: @debri
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @debri
    assert_response :success
  end

  test "should update debri" do
    patch :update, id: @debri, debri: { angle: @debri.angle, deleted: @debri.deleted, height: @debri.height, object_type_id: @debri.object_type_id, size: @debri.size, word: @debri.word }
    assert_redirected_to debri_path(assigns(:debri))
  end

  test "should destroy debri" do
    assert_difference('Debri.count', -1) do
      delete :destroy, id: @debri
    end

    assert_redirected_to debris_path
  end
end
