class PessoaSistemaController < ApplicationController
  
  #before_action :set_produto
  before_action :current_usuario
  before_action :logged_in_usuario
  
  def new
  end
  
  def create
  end
  def addpessoa
    puts "Adicionando em pessoa sistema"
    @pessoaSistema = PessoaSistema.new(pessoa_sistema_parans)
    if @pessoaSistema.save
      #redirect_to @usuario, notice: 'Usuario was successfully created.'
      flash[:notice] = "Responsável adicionado com sucesso"
    else
      flash[:danger] = "Falha ao adicionar Responsável"
    end
  end 
  
  private

  def pessoa_sistema_parans
   params.require(:pessoa_sistema).permit(:pessoa_id, :sistema_id)
  end
  
end
