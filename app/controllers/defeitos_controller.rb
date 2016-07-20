class DefeitosController < ApplicationController
  before_action :set_defeito, only: [:show, :edit, :update, :destroy]
  before_action :release_note_params, only: [:new]
  before_action :current_usuario
  before_action :logged_in_usuario

  # GET /defeitos
  # GET /defeitos.json
  def index
    @defeitos = Defeito.all
  end

  # GET /defeitos/1
  # GET /defeitos/1.json
  def show
  end

  # GET /defeitos/new
  def new
    @defeito = Defeito.new
  end

  # GET /defeitos/1/edit
  def edit
  end

  # POST /defeitos
  # POST /defeitos.json
  def create
    @defeito = Defeito.new(defeito_params)
    #@defeito.release_note_id = @release_note.id
    #respond_to do |format|
      if @defeito.save
         flash[:success] = "Defeito adicionado com Sucesso !"
        redirect_to edit_release_note_path busca_release_note(@defeito.release_note_id) , tab:"defeitos"
        #format.html { redirect_to @defeito, notice: 'Defeito was successfully created.' }
       # format.json { render :show, status: :created, location: @defeito }
      else
        #format.html { render :new }
       # format.json { render json: @defeito.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /defeitos/1
  # PATCH/PUT /defeitos/1.json
  def update
    respond_to do |format|
      if @defeito.update(defeito_params)
        format.html { redirect_to @defeito, notice: 'Defeito was successfully updated.' }
        format.json { render :show, status: :ok, location: @defeito }
      else
        format.html { render :edit }
        format.json { render json: @defeito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defeitos/1
  # DELETE /defeitos/1.json
  def destroy
    id_release_temp = @defeito.release_note_id
    @defeito.destroy
    flash[:success] = "Defeito removido com Sucesso !"
    redirect_to edit_release_note_path busca_release_note(id_release_temp), tab:"defeitos"
    #respond_to do |format|
    #  format.html { redirect_to defeitos_url, notice: 'Defeito was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_defeito
      @defeito = Defeito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def defeito_params
      params.require(:defeito).permit(:release_note_id, :descricao)
    end
    
    def release_note_params
      @release_note = ReleaseNote.find(params[:release_id])
    end
    def busca_release_note(release_id)
      @release_note = ReleaseNote.find(release_id)
    end
end
