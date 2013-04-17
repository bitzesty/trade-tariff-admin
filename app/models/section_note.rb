class SectionNote < Sequel::Model
  set_dataset order(:section_id.asc)

  many_to_one :section
end
