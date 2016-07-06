class CreateCaracteristicaReleases < ActiveRecord::Migration
  def change
    create_table :caracteristica_releases do |t|
      t.belongs_to :caracteristica, index: true, foreign_key: true
      t.belongs_to :release_note, index: true, foreign_key: true
      t.boolean :status
      t.string :descricao

      t.timestamps null: false
    end
  end
end
