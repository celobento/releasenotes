class AddRelembremeDigestToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :relembreme_digest, :string
  end
end
