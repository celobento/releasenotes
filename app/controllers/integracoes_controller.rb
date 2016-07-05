class IntegracoesController < ApplicationController
  
  before_action :set_integracao, only: [:destroy]
  before_action :release_note_params, only: [:new]
  
  def new
    @integracao = Integracao.new
    @tipo_integracoes = TipoIntegracao.all
  end

  def create
    @integracao = Integracao.new(integracao_params)
    if @integracao.save
      flash[:success] = "Integração adicionada com Sucesso !"
      redirect_to edit_release_note_path busca_release_note(@integracao.release_note_id) , tab:"integracoes"
      
    else
      
    end
  end

  def destroy
    id_release_temp = @integracao.release_note_id
    @integracao.destroy
    flash[:success] = "Integração removida com sucesso !"
    redirect_to edit_release_note_path busca_release_note(id_release_temp), tab:"integracoes"
  end
  
  private
  
  def set_integracao
    @integracao = Integracao.find(params[:id])
  end
  
  def integracao_params
    params.require(:integracao).permit(:release_note_id, :tipo_integracao_id, :descricao)
  end
  
  def release_note_params
    @release_note = ReleaseNote.find(params[:release_id])
  end
  
  def busca_release_note(release_id)
    @release_note = ReleaseNote.find(release_id)
  end
  
end
