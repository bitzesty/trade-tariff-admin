class SearchReference
  include Her::Model

  include_root_in_json true

  attributes :title
  attributes :section_id
  attributes :heading_id
  attributes :chapter_id
  attributes :referenced_entity
  attributes :reference_class

  validates :title, presence: true

  def referenced_entity
    reference_class.new(attributes['referenced_entity'])
  end

  private

  def reference_class
    attributes['reference_class'].constantize
  end
end
