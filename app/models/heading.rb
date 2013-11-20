require 'heading/search_reference'

class Heading
  include Her::Model

  has_many :search_references, class_name: 'Heading::SearchReference'
  has_many :commodities
  has_one :section
  has_one :chapter

  def heading_id
    goods_nomenclature_item_id.first(4)
  end

  def chapter_id
    chapter.short_code
  end

  def id
    to_param
  end

  def to_param
    heading_id.to_s
  end

  def reference_title
    "Heading (#{heading_id})"
  end

  def request_path(opts = {})
    self.class.build_request_path("/headings/#{to_param}", attributes.dup)
  end
end
