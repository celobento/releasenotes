class AddPathSvnToReleaseNotes < ActiveRecord::Migration
  def change
    add_column :release_notes, :path_svn, :string
  end
end
