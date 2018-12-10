class DeleteColumnsAndColumnBio < ActiveRecord::Migration[5.2]
  def change
    remove_column :authorizations, :first_name
    remove_column :authorizations, :last_name
    remove_column :authorizations, :link 
    add_column :authorizations, :username, :string
    add_column :authorizations, :bio, :text
  end
end
