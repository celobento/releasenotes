json.array!(@sistemas) do |sistema|
  json.extract! sistema, :id, :nome, :sigla
  json.url sistema_url(sistema, format: :json)
end
