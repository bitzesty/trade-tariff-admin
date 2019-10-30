class CreateImportTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :import_tasks do |t|
      t.integer :status, default: 0
      t.text :file_data

      t.timestamps
    end
  end
end
