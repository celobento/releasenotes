require 'test_helper'

class DefeitosControllerTest < ActionController::TestCase
  setup do
    @defeito = defeitos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:defeitos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create defeito" do
    assert_difference('Defeito.count') do
      post :create, defeito: { descricao: @defeito.descricao, release_note_id: @defeito.release_note_id }
    end

    assert_redirected_to defeito_path(assigns(:defeito))
  end

  test "should show defeito" do
    get :show, id: @defeito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @defeito
    assert_response :success
  end

  test "should update defeito" do
    patch :update, id: @defeito, defeito: { descricao: @defeito.descricao, release_note_id: @defeito.release_note_id }
    assert_redirected_to defeito_path(assigns(:defeito))
  end

  test "should destroy defeito" do
    assert_difference('Defeito.count', -1) do
      delete :destroy, id: @defeito
    end

    assert_redirected_to defeitos_path
  end
end
