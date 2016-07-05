json.array!(@observacoes) do |observacao|
  json.extract! observacao, :id, :release_note_id, :descricao
  json.url observacao_url(observacao, format: :json)
end
