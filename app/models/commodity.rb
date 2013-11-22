require 'commodity/search_reference'

class Commodity
  include Her::Model

  attributes :leaf

  has_many :search_references, class_name: 'Commodity::SearchReference'

  def id
    to_param
  end

  def to_param
    goods_nomenclature_item_id
  end

  def heading_id
    goods_nomenclature_item_id.first(4)
  end

  def reference_title
    "Commodity (#{to_param})"
  end

  def declarable
    leaf
  end

  def request_path(opts = {})
    self.class.build_request_path("/commodities/#{to_param}", attributes.dup)
  end
end
