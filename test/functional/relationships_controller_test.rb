require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relationship" do
    assert_difference('Relationship.count') do
      post :create, :relationship => { }
    end

    assert_redirected_to relationship_path(assigns(:relationship))
  end

  test "should show relationship" do
    get :show, :id => relationships(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => relationships(:one).id
    assert_response :success
  end

  test "should update relationship" do
    put :update, :id => relationships(:one).id, :relationship => { }
    assert_redirected_to relationship_path(assigns(:relationship))
  end

  test "should destroy relationship" do
    assert_difference('Relationship.count', -1) do
      delete :destroy, :id => relationships(:one).id
    end

    assert_redirected_to relationships_path
  end
end
