require 'chapter/search_reference'

class Chapter
  include Her::Model

  attributes :chapter_note_id

  has_one :chapter_note, name: '_chapter_note', data_key: '_chapter_note_id', path: '/chapter_note'
  has_many :headings
  has_many :search_references, class_name: 'Chapter::SearchReference'

  def has_chapter_note?
    chapter_note_id.present?
  end

  def short_code
    goods_nomenclature_item_id.first(2)
  end

  def id
    to_param
  end

  def reference_title
    "Chapter (#{short_code})"
  end

  def to_param
    short_code
  end

  def to_s
    goods_nomenclature_item_id
  end

  def request_path(opts = {})
    self.class.build_request_path("/chapters/#{to_param}", attributes.dup)
  end
end
