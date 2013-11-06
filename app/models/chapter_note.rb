class ChapterNote
  include Her::Model
  extend ActiveModel::Naming

  attributes :content

  validates :content, presence: true

  primary_key nil

  resource_path "chapters/:chapter_id/chapter_note"
  collection_path "chapters/:chapter_id/chapter_note"

  include_root_in_json :chapter_note

  belongs_to :chapter

  # NOTE singular resource
  def request_path
    self.class.build_request_path("/chapters/:chapter_id/chapter_note", attributes.dup.merge('chapter_id' => chapter.fetch.to_param))
  end

  def preview
    Govspeak::Document.new(content).to_sanitized_html.html_safe
  end
end
