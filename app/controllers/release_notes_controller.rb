class ReleaseNotesController < ApplicationController
  before_action :set_release_note, only: [:show, :edit, :update, :destroy]

  # GET /release_notes
  # GET /release_notes.json
  def index
    @release_notes = ReleaseNote.paginate(page: params[:page], :per_page => 2)
    @release_notes_all = ReleaseNote.all
  end

  # GET /release_notes/1
  # GET /release_notes/1.json
  def show
    @sistemas = Sistema.all
    @defeitos = Defeito.where(release_note_id: @release_note.id)
    @observacoes = Observacao.where(release_note_id: @release_note.id)
    @integracoes = Integracao.where(release_note_id: @release_note.id)
    @caracteristica_releases = CaracteristicaRelease.where(release_note_id: @release_note.id)
  end

  # GET /release_notes/new
  def new
    @release_note = ReleaseNote.new
    @sistemas = Sistema.all
    @defeitos = Defeito.where(release_note_id: @release_note.id)
    @observacoes = Observacao.where(release_note_id: @release_note.id)
    @integracoes = Integracao.where(release_note_id: @release_note.id)
    @caracteristica_releases = CaracteristicaRelease.where(release_note_id: @release_note.id)
  end

  # GET /release_notes/1/edit
  def edit
    @sistemas = Sistema.all
    @defeitos = Defeito.where(release_note_id: @release_note.id)
    @observacoes = Observacao.where(release_note_id: @release_note.id)
    @integracoes = Integracao.where(release_note_id: @release_note.id)
    @caracteristica_releases = CaracteristicaRelease.where(release_note_id: @release_note.id)
  end

  # POST /release_notes
  # POST /release_notes.json
  def create

    @release_note = ReleaseNote.new(release_note_params)
    if @release_note.save
      flash[:success] = "Release criada com sucesso !"
      redirect_to edit_release_note_path @release_note, tab:"descricao"
    else
      flash[:danger] = "Falha ao criar Release !"
      render :new
    end
  end

  # PATCH/PUT /release_notes/1
  # PATCH/PUT /release_notes/1.json
  def update
   
      if @release_note.update(release_note_params)
        flash[:success] = "Release atualizado com sucesso !"
        redirect_to release_note_path @release_note, tab:"descricao"
      else
        flash[:success] = "Falha ao atualizar release !"
        render :edit
      end
  end

  # DELETE /release_notes/1
  # DELETE /release_notes/1.json
  def destroy
    @release_note.destroy
    flash[:success] = "Release removido com sucesso !"
    redirect_to release_notes_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_release_note
      @release_note = ReleaseNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_note_params
      params.require(:release_note).permit(:sistema_id, :path_deploy, :contexto, :motivacao, :instrucao_uso, :monitoramento)
    end
end
