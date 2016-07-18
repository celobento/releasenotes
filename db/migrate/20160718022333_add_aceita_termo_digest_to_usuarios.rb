class AddAceitaTermoDigestToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :aceita_termo_digest, :string
  end
end
