json.array!(@release_notes) do |release_note|
  json.extract! release_note, :id, :sistema_id, :path_deploy, :contexto, :motivacao, :instrucao_uso, :monitoramento
  json.url release_note_url(release_note, format: :json)
end
