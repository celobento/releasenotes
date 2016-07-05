json.array!(@pessoas) do |pessoa|
  json.extract! pessoa, :id, :nome, :email, :matricula
  json.url pessoa_url(pessoa, format: :json)
end
