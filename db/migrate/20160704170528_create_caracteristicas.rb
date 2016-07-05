class CreateCaracteristicas < ActiveRecord::Migration
  def change
    create_table :caracteristicas do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
