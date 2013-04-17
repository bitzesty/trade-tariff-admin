class Section < Sequel::Model
  one_to_one :section_note
end
