class ChapterNote
  include Her::JsonApi::Model
  extend ActiveModel::Naming

  resource_path "/admin/chapters/:chapter_id/chapter_note"
  collection_path "/admin/chapters/:chapter_id/chapter_note"

  attributes :content

  validates :content, presence: true

  belongs_to :chapter

  # NOTE singular resource
  def request_path
    self.class.build_request_path("/admin/chapters/:chapter_id/chapter_note", attributes.dup.merge('chapter_id' => chapter.reload.to_param))
  end

  def preview
    Govspeak::Document.new(content, sanitize: true).to_html.html_safe
  end
end
