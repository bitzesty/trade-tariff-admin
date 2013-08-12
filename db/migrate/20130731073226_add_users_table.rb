Sequel.migration do
  up do
    create_table :users do
      primary_key :id
      String      :uid
      String      :name
      String      :email
      Integer     :version
      String      :permissions, text: true
      TrueClass   :remotely_signed_out, default: false
      DateTime    :updated_at
      DateTime    :created_at
    end
  end

  down do
    drop_table :users
  end
end
