class ImportSearchReferencesJob < ApplicationJob
  queue_as :default

  def perform(import_task_id)
    import_task = ImportTask.find(import_task_id)
    begin
      import_task.update(status: :in_progress)
      csv_file = import_task.file.download
      SearchReference::ImportService.from_csv!(csv_file)
      import_task.update(status: :successful)
    rescue => _
      import_task.update(status: :failed)
    end
  end
end
