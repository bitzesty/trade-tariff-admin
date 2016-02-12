class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :uid
      t.string  :name
      t.string  :email
      t.integer :version
      t.text    :permissions
      t.string  :access_token
      t.string  :organisation_slug
      t.string  :organisation_content_id
      t.boolean :disabled, default: false
      t.boolean :remotely_signed_out, default: false

      t.timestamps null: false
    end
  end
end
