module UsuariosHelper
    # Returns the Gravatar for the given usuario.
    def gravatar_for(usuario)
        if usuario.email.nil? == false
            gravatar_id = Digest::MD5::hexdigest(usuario.email.downcase)
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
            image_tag(gravatar_url, alt: usuario.nome, class: "gravatar")
        end 
    end
end
