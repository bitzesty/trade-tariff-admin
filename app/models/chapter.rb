require 'chapter/search_reference'

class Chapter
  include Her::Model

  attributes :chapter_note_id, :headings_from, :headings_to, :section_id

  has_one :chapter_note, name: '_chapter_note', data_key: '_chapter_note_id', path: '/chapter_note'
  has_many :headings
  has_many :search_references, class_name: 'Chapter::SearchReference'
  has_one :section

  def has_chapter_note?
    chapter_note_id.present?
  end

  def short_code
    goods_nomenclature_item_id.first(2)
  end

  def headings_range
    if headings_from == headings_to
      headings_from
    else
      "#{headings_from} to #{headings_to}"
    end
  end

  def headings_from=(headings_from)
    attributes[:headings_from] = headings_from.last(2).to_i
  end

  def headings_to=(headings_to)
    attributes[:headings_to] = headings_to.last(2).to_i
  end

  def id
    short_code
  end

  def reference_title
    "Chapter (#{short_code})"
  end

  def to_param
    short_code.to_s
  end

  def to_s
    goods_nomenclature_item_id
  end

  def request_path(opts = {})
    self.class.build_request_path("/chapters/#{to_param}", attributes.dup)
  end
end
