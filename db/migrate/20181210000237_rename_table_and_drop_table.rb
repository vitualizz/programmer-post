class RenameTableAndDropTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :socials
    rename_table :authorizations, :socials
  end
end
