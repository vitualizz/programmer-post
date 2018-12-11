class RebornSocials < ActiveRecord::Migration[5.2]
  def change
    rename_column :socials, :bio, :description
    remove_column :socials, :secret
    add_column :socials, :email, :string
    add_column :socials, :url, :string 
  end
end
