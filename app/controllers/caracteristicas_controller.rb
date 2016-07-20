class CaracteristicasController < ApplicationController
  
  before_action :set_caracteristica, only: [:show, :edit, :update, :destroy]
  before_action :current_usuario
  before_action :logged_in_usuario
  
  def index
    @caracteristicas = Caracteristica.paginate(page: params[:page], :per_page => 10)
  end

  def new
    @caracteristica = Caracteristica.new
  end
  
  def create
    @caracteristica = Caracteristica.new(caracteristica_params)
    if @caracteristica.save
      flash[:success] = "Caracteristica adicionada com Sucesso !"
      redirect_to caracteristicas_path
    else
      flash[:danger] = "Falha ao adicionar Caracteristica !"
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @caracteristica.destroy
    flash[:success] = "Caracteristica removida com Sucesso !"
    redirect_to caracteristicas_path
  end
  
  private
 
  def set_caracteristica
    @caracteristica = Caracteristica.find(params[:id])
  end

  def caracteristica_params
    params.require(:caracteristica).permit(:nome)
  end
  
end
