module SessionsHelper
    
    # Logs in the given usuario.
    def log_in(usuario)
        session[:usuario_id] = usuario.id
    end
    
    # Logs out the current usuario.
    def log_out
        forget(current_usuario)
        session.delete(:usuario_id)
        @current_usuario = nil
    end

    # Remembers a usuario in a persistent session.
    def remember(usuario)
        usuario.remember
        cookies.permanent.signed[:usuario_id] = usuario.id
        cookies.permanent[:remember_token] = usuario.remember_token
        
        #cookies[:remember_token] = { value:   remember_token,
        #                             expires: 20.years.from_now.utc }
    end
    
    # Forgets a persistent session.
    def forget(usuario)
        usuario.forget
        cookies.delete(:usuario_id)
        cookies.delete(:remember_token)
    end
    
    # Redirects to stored location (or to the default).
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    
    # Returns true if the usuario is logged in, false otherwise.
    def logged_in?
        !current_usuario.nil?
    end
    
    # Returns the current logged-in usuario (if any).
    def current_usuario
        if (usuario_id = session[:usuario_id])
            @current_usuario ||= Usuario.find_by(id: usuario_id)
        elsif (usuario_id = cookies.signed[:usuario_id])
            usuario = Usuario.find_by(id: usuario_id)
            #if usuario && usuario.authenticated?(cookies[:remember_token])
            if usuario && usuario.authenticated?(:remember, cookies[:remember_token])
                log_in usuario
                @current_usuario = usuario
            end
        end
    end
    
    # Returns true if the given usuario is the current usuario.
    def current_usuario?(usuario)
        usuario == current_usuario
    end
    
    # Confirms a logged-in usuario.
    def logged_in_usuario
      unless logged_in?
      store_location
        flash[:warning] = "Efetue Login."
        redirect_to login_url
      end
    end
    
    # Stores the URL trying to be accessed.
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
    
end
