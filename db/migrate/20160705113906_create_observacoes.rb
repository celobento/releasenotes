class CreateObservacoes < ActiveRecord::Migration
  def change
    create_table :observacoes do |t|
      t.belongs_to :release_note, index: true, foreign_key: true
      t.string :descricao

      t.timestamps null: false
    end
  end
end
