json.array!(@tipo_integracoes) do |tipo_integracao|
  json.extract! tipo_integracao, :id, :nome
  json.url tipo_integracao_url(tipo_integracao, format: :json)
end
