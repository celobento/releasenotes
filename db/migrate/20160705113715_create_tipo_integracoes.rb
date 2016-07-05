class CreateTipoIntegracoes < ActiveRecord::Migration
  def change
    create_table :tipo_integracoes do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
