class SectionNote
  include Her::Model
  extend ActiveModel::Naming

  attributes :content

  validates :content, presence: true

  primary_key nil

  resource_path "sections/:section_id/section_note"
  collection_path "sections/:section_id/section_note"

  include_root_in_json :section_note

  belongs_to :section

  # NOTE singular resource
  def request_path
    self.class.build_request_path("/sections/:section_id/section_note", attributes.dup)
  end

  def section_title
  end

  def preview
    Govspeak::Document.new(content).to_sanitized_html.html_safe
  end
end
