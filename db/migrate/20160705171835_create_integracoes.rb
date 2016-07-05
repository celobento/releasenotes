class CreateIntegracoes < ActiveRecord::Migration
  def change
    create_table :integracoes do |t|
      t.belongs_to :tipo_integracao, index: true, foreign_key: true
      t.belongs_to :release_note, index: true, foreign_key: true
      t.string :descricao

      t.timestamps null: false
    end
  end
end
