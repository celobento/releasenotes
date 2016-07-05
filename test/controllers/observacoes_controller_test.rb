require 'test_helper'

class ObservacoesControllerTest < ActionController::TestCase
  setup do
    @observacao = observacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:observacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create observacao" do
    assert_difference('Observacao.count') do
      post :create, observacao: { descricao: @observacao.descricao, release_note_id: @observacao.release_note_id }
    end

    assert_redirected_to observacao_path(assigns(:observacao))
  end

  test "should show observacao" do
    get :show, id: @observacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @observacao
    assert_response :success
  end

  test "should update observacao" do
    patch :update, id: @observacao, observacao: { descricao: @observacao.descricao, release_note_id: @observacao.release_note_id }
    assert_redirected_to observacao_path(assigns(:observacao))
  end

  test "should destroy observacao" do
    assert_difference('Observacao.count', -1) do
      delete :destroy, id: @observacao
    end

    assert_redirected_to observacoes_path
  end
end
