class CreatePessoaSistemas < ActiveRecord::Migration
  def change
    create_table :pessoa_sistemas do |t|
      t.belongs_to :sistema, index: true, foreign_key: true
      t.belongs_to :pessoa, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
