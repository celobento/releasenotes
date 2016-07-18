json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nome, :email, :status, :perfil_id_id
  json.url usuario_url(usuario, format: :json)
end
