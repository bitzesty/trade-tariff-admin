require 'heading/search_reference'

class Heading
  include Her::Model

  has_many :search_references, class_name: 'Heading::SearchReference'

  def heading_id
    goods_nomenclature_item_id.first(4)
  end

  def id
    to_param
  end

  def to_param
    heading_id
  end

  def reference_title
    "Heading (#{heading_id})"
  end

  def request_path(opts = {})
    self.class.build_request_path("/headings/#{to_param}", attributes.dup)
  end
end
