class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :current_usuario,   only: [:show, :edit, :update, :index]
  before_action :logged_in_usuario,   only: [:show, :edit, :update, :index]
  before_action :correct_usuario,   only: [:show, :edit, :update]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.paginate(page: params[:page], :per_page => 10)
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @perfis = Perfil.all
  end
  

  # GET /usuarios/1/edit
  def edit
    @perfis = Perfil.all
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
        flash[:success] = "Usuario criado com sucesso !"
        redirect_to usuarios_path
      else

      end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    #respond_to do |format|
      if @usuario.update(usuario_params)
         flash[:success] = "Usuario atualizado com sucesso !"
        redirect_to usuarios_path
        #format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
       # format.json { render :show, status: :ok, location: @usuario }
      else
       # format.html { render :edit }
       # format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def cadastro
    @usuario = Usuario.new
  end
  
  def signup
    
    usuario_params_signup
    usuario_existente = Usuario.find_by(email: params[:session][:email].downcase)
    
    if usuario_existente == nil
    
      @usuario = Usuario.new(nome: params[:session][:nome] , email: params[:session][:email], password: params[:session][:password], password_confirmation: params[:session][:password_confirmation])
      @usuario.status = true
      @usuario.perfil_id = 1
      
      aceita_termo = params[:session][:aceita_termo]
      
      if aceita_termo == "1"
      
        if @usuario.save
          flash[:success] = "Efetue login !"
          redirect_to login_path
        else
          
        end
        
      else
        
        flash[:warning] = "Aceite os Termos !"
        #redirect_to login_path
        #redirect_to signup_path, action: :signup
        #render template: "sessions/signup.html.erb"
        render :signup
  
      end
    
    else
      
      flash[:warning] = "E-mail já cadastrado !"
      redirect_to login_path
    
    end
    
    #usuario = Usuario.find_by(email: params[:session][:email].downcase)
    #if usuario && usuario.authenticate(params[:session][:password])
      #log_in usuario
      #params[:session][:remember_me] == '1' ? remember(usuario) : forget(usuario)
      #redirect_back_or usuario
      #if usuario.activated?
    #    log_in usuario
    #    params[:session][:remember_me] == '1' ? remember(usuario) : forget(usuario)
    #    flash[:success] = 'Bem-vindo ao sistema!' # Not quite right!
    #    redirect_back_or release_notes_path
      #else
      #  message  = "Account not activated. "
      #  message += "Check your email for the activation link."
      #  flash[:warning] = message
      #  redirect_to root_url
      #end
    #else
    #  flash[:danger] = 'Combinação de e-mail/senha inválida' # Not quite right!
    #  render 'new'
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :status, :perfil_id, :password, :password_confirmation)
    end
    
    def usuario_params_signup
      params.require(:session).permit(:nome, :email, :password, :password_confirmation, :aceita_termo)
    end
    
    # Confirms the correct usuario.
    def correct_usuario
      @usuario = Usuario.find(params[:id])
      #redirect_to(root_url) unless @usuario == current_usuario
      flash[:warning] = "Acesso restrito !"
      redirect_to(release_notes_path) unless current_usuario?(@usuario)
    end
end
