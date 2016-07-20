class TipoIntegracoesController < ApplicationController
  before_action :set_tipo_integracao, only: [:show, :edit, :update, :destroy]
  before_action :current_usuario
  before_action :logged_in_usuario

  # GET /tipo_integracoes
  # GET /tipo_integracoes.json
  def index
    @tipo_integracoes = TipoIntegracao.paginate(page: params[:page], :per_page => 10)
  end

  # GET /tipo_integracoes/1
  # GET /tipo_integracoes/1.json
  def show
  end

  # GET /tipo_integracoes/new
  def new
    @tipo_integracao = TipoIntegracao.new
  end

  # GET /tipo_integracoes/1/edit
  def edit
  end

  # POST /tipo_integracoes
  # POST /tipo_integracoes.json
  def create
    @tipo_integracao = TipoIntegracao.new(tipo_integracao_params)
    if @tipo_integracao.save
      flash[:success] = "Tipo criado com sucesso !"
       redirect_to tipo_integracoes_path
     else

     end
  end

  # PATCH/PUT /tipo_integracoes/1
  # PATCH/PUT /tipo_integracoes/1.json
  def update
    respond_to do |format|
      if @tipo_integracao.update(tipo_integracao_params)
        format.html { redirect_to @tipo_integracao, notice: 'Tipo integracao was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_integracao }
      else
        format.html { render :edit }
        format.json { render json: @tipo_integracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_integracoes/1
  # DELETE /tipo_integracoes/1.json
  def destroy
    @tipo_integracao.destroy
    respond_to do |format|
      format.html { redirect_to tipo_integracoes_url, notice: 'Tipo integracao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_integracao
      @tipo_integracao = TipoIntegracao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_integracao_params
      params.require(:tipo_integracao).permit(:nome)
    end
end
