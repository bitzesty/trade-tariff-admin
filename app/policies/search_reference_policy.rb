class SearchReferencePolicy < Struct.new(:user, :search_reference)
  def edit?
    user.gds_editor? || user.hmrc_editor?
  end
end

