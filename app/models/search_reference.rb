class SearchReference
  include Her::JsonApi::Model

  include_root_in_json true

  attributes :title
  attributes :referenced_id
  attributes :referenced_class

  validates :title, presence: true

  def referenced_entity
    referenced_class.find(referenced_id)
  end

  def referenced_class
    attributes['referenced_class'].constantize
  end
end
