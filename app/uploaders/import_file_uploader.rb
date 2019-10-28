class ImportFileUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[text/csv]
  end
end
