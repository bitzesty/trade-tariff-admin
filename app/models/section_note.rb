class SectionNote
  include Her::JsonApi::Model
  extend ActiveModel::Naming

  resource_path '/admin/sections/:section_id/section_note'
  collection_path '/admin/sections/:section_id/section_note'

  attributes :content

  validates :content, presence: true

  belongs_to :section

  # NOTE singular resource
  def request_path
    self.class.build_request_path("/admin/sections/:section_id/section_note", attributes.dup)
  end

  def section_title; end

  def preview
    Govspeak::Document.new(content).to_sanitized_html.html_safe
  end
end
