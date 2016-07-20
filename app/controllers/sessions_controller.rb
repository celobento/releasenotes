class SessionsController < ApplicationController
  
  before_action :current_usuario
  
  def new
    
  end
  
  def signup
    @usuario = Usuario.new
  end
  
  def create
    usuario = Usuario.find_by(email: params[:session][:email].downcase)
    if usuario && usuario.authenticate(params[:session][:password])
      #log_in usuario
      #params[:session][:remember_me] == '1' ? remember(usuario) : forget(usuario)
      #redirect_back_or usuario
      #if usuario.activated?
        log_in usuario
        params[:session][:remember_me] == '1' ? remember(usuario) : forget(usuario)
        flash[:success] = 'Bem-vindo ao sistema!' # Not quite right!
        redirect_back_or release_notes_path
      #else
      #  message  = "Account not activated. "
      #  message += "Check your email for the activation link."
      #  flash[:warning] = message
      #  redirect_to root_url
      #end
    else
      flash[:danger] = 'Combinação de e-mail/senha inválida' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
