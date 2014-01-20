class Rollback
  include Her::Model

  attributes :jid, :enqueued_at, :redownload, :date

  collection_path '/rollbacks'

  include_root_in_json true

  def initialize_errors
    response_errors.each do |attribute, error_messages|
      Array(error_messages).each do |error_message|
        errors.add(attribute, error_message)
      end
    end
  end
end
