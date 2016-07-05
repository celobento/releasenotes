class CreateSistemas < ActiveRecord::Migration
  def change
    create_table :sistemas do |t|
      t.string :nome
      t.string :sigla

      t.timestamps null: false
    end
  end
end
