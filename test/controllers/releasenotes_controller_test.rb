require 'test_helper'

class ReleasenotesControllerTest < ActionController::TestCase
  setup do
    @release_note = release_note(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:release_note)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create release_note" do
    assert_difference('ReleaseNote.count') do
      post :create, release_note: { contexto: @release_note.contexto, instrucao_uso: @release_note.instrucao_uso, monitoramento: @release_note.monitoramento, moticacao: @release_note.moticacao, path_deploy: @release_note.path_deploy, pessoa_id: @release_note.pessoa_id }
    end

    assert_redirected_to release_note_path(assigns(:release_note))
  end

  test "should show release_note" do
    get :show, id: @release_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @release_note
    assert_response :success
  end

  test "should update release_note" do
    patch :update, id: @release_note, release_note: { contexto: @release_note.contexto, instrucao_uso: @release_note.instrucao_uso, monitoramento: @release_note.monitoramento, moticacao: @release_note.moticacao, path_deploy: @release_note.path_deploy, pessoa_id: @release_note.pessoa_id }
    assert_redirected_to release_note_path(assigns(:release_note))
  end

  test "should destroy release_note" do
    assert_difference('ReleaseNote.count', -1) do
      delete :destroy, id: @release_note
    end

    assert_redirected_to release_note_index_path
  end
end
