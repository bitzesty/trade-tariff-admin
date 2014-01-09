class SearchReference
  include Her::Model

  include_root_in_json true

  attributes :title
  attributes :referenced
  attributes :referenced_id
  attributes :referenced_class

  validates :title, presence: true

  def referenced_entity
    referenced_class.new(attributes['referenced'])
  end

  def referenced_class
    attributes['referenced_class'].constantize
  end
end
