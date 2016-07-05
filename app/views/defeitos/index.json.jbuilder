json.array!(@defeitos) do |defeito|
  json.extract! defeito, :id, :release_note_id, :descricao
  json.url defeito_url(defeito, format: :json)
end
