class CreateAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :token
      t.string :secret
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
