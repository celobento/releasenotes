require 'test_helper'

class TipoIntegracoesControllerTest < ActionController::TestCase
  setup do
    @tipo_integracao = tipo_integracoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_integracoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_integracao" do
    assert_difference('TipoIntegracao.count') do
      post :create, tipo_integracao: { nome: @tipo_integracao.nome }
    end

    assert_redirected_to tipo_integracao_path(assigns(:tipo_integracao))
  end

  test "should show tipo_integracao" do
    get :show, id: @tipo_integracao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_integracao
    assert_response :success
  end

  test "should update tipo_integracao" do
    patch :update, id: @tipo_integracao, tipo_integracao: { nome: @tipo_integracao.nome }
    assert_redirected_to tipo_integracao_path(assigns(:tipo_integracao))
  end

  test "should destroy tipo_integracao" do
    assert_difference('TipoIntegracao.count', -1) do
      delete :destroy, id: @tipo_integracao
    end

    assert_redirected_to tipo_integracoes_path
  end
end
