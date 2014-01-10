require 'section/search_reference'

class Section
  include Her::Model

  has_one :section_note, name: '_section_note', data_key: '_section_note'
  has_many :chapters
  has_many :search_references, class_name: 'Section::SearchReference'

  attributes :chapter_from, :chapter_to

  def has_section_note?
    section_note_id.present?
  end

  def chapter_from=(chapter_from)
    attributes[:chapter_from] = chapter_from.to_i
  end

  def chapter_to=(chapter_to)
    attributes[:chapter_to] = chapter_to.to_i
  end

  def chapters_range
    if chapter_from == chapter_to
      chapter_from
    else
      "#{chapter_from} to #{chapter_to}"
    end
  end

  def reference_title
    "Section (#{position})"
  end

  def to_param
    id.to_s
  end

  def to_s
    title
  end
end
