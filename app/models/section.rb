require 'section/search_reference'

class Section
  include Her::Model

  has_one :section_note, name: '_section_note', data_key: '_section_note'
  has_many :chapters
  has_many :search_references, class_name: 'Section::SearchReference'

  def has_section_note?
    section_note_id.present?
  end

  def reference_title
    "Section (#{position})"
  end

  def to_param
    position
  end

  def to_s
    title
  end
end
