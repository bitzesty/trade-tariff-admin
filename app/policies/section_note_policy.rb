class SectionNotePolicy < Struct.new(:user, :section_note)
  def edit?
    user.gds_editor? || user.hmrc_editor?
  end
end

