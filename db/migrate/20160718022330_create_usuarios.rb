class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.boolean :status
      t.belongs_to :perfil, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
