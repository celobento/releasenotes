class CreatePerfis < ActiveRecord::Migration
  def change
    create_table :perfis do |t|
      t.string :nome
      t.string :role
      t.string :descrcicao
      t.boolean :status

      t.timestamps null: false
    end
  end
end
