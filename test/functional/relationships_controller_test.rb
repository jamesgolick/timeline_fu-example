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
      post :create, :relationship => { :person_id => people(:francois).id, :friend_id => people(:james).id }
    end

    assert_redirected_to relationship_path(assigns(:relationship))
    assert_equal people(:francois), assigns(:relationship).person
    assert_equal people(:james), assigns(:relationship).friend
  end

  test "should show relationship" do
    get :show, :id => relationships(:james_to_francois).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => relationships(:james_to_francois).id
    assert_response :success
  end

  test "should update relationship" do
    put :update, :id => relationships(:james_to_francois).id, :relationship => { }
    assert_redirected_to relationship_path(assigns(:relationship))
  end

  test "should destroy relationship" do
    assert_difference('Relationship.count', -1) do
      delete :destroy, :id => relationships(:james_to_francois).id
    end

    assert_redirected_to relationships_path
  end
end
