class Section
  # one_to_one :section_note

  # dataset_module do
  #   def without_notes
  #     where{ ~{id: SectionNote.select(:section_id)} }
  #   end
  # end

  def to_s
    title
  end
end
