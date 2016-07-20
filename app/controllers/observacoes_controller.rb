class ObservacoesController < ApplicationController
  before_action :set_observacao, only: [:show, :edit, :update, :destroy]
  before_action :release_note_params, only: [:new]
  before_action :current_usuario
  before_action :logged_in_usuario

  # GET /observacoes
  # GET /observacoes.json
  def index
    @observacoes = Observacao.all
  end

  # GET /observacoes/1
  # GET /observacoes/1.json
  def show
  end

  # GET /observacoes/new
  def new
    @observacao = Observacao.new
  end

  # GET /observacoes/1/edit
  def edit
  end

  # POST /observacoes
  # POST /observacoes.json
  def create
    @observacao = Observacao.new(observacao_params)

    #respond_to do |format|
      if @observacao.save
        flash[:success] = "Observação adicionada com sucesso !"
        redirect_to edit_release_note_path busca_release_note(@observacao.release_note_id) , tab:"observacoes"
        #format.html { redirect_to @observacao, notice: 'Observacao was successfully created.' }
        #format.json { render :show, status: :created, location: @observacao }
      else
        #format.html { render :new }
        #format.json { render json: @observacao.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /observacoes/1
  # PATCH/PUT /observacoes/1.json
  def update
    respond_to do |format|
      if @observacao.update(observacao_params)
        format.html { redirect_to @observacao, notice: 'Observacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @observacao }
      else
        format.html { render :edit }
        format.json { render json: @observacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observacoes/1
  # DELETE /observacoes/1.json
  def destroy
    id_release_temp = @observacao.release_note_id
    @observacao.destroy
    flash[:success] = "Observação removida com sucesso !"
    redirect_to edit_release_note_path busca_release_note(id_release_temp) , tab:"observacoes"
    #respond_to do |format|
    #  format.html { redirect_to observacoes_url, notice: 'Observacao was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observacao
      @observacao = Observacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observacao_params
      params.require(:observacao).permit(:release_note_id, :descricao)
    end
    
    def release_note_params
      @release_note = ReleaseNote.find(params[:release_id])
    end
    
    def busca_release_note(release_id)
      @release_note = ReleaseNote.find(release_id)
    end
end
