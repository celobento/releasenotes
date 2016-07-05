class CreateReleaseNotes < ActiveRecord::Migration
  def change
    create_table :release_notes do |t|
      t.belongs_to :sistema, index: true, foreign_key: true
      t.string :path_deploy
      t.string :contexto
      t.string :motivacao
      t.string :instrucao_uso
      t.string :monitoramento

      t.timestamps null: false
    end
  end
end
