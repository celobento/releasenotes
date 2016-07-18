json.array!(@perfis) do |perfil|
  json.extract! perfil, :id, :nome, :role, :descrcicao, :status
  json.url perfil_url(perfil, format: :json)
end
