class ImportTask < ApplicationRecord
  include ImportFileUploader::Attachment(:file)
  enum status: [:in_queue, :in_progress, :failed, :successful]
end
