Sequel.migration do
  change do
    alter_table :users do
      add_column :access_token, String
    end
  end
end
