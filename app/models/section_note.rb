class SectionNote
  # plugin :validation_helpers

  # set_dataset order(:section_id.asc)

  # many_to_one :section

  def validate
    super

    validates_presence [:section_id, :content]
  end
end
