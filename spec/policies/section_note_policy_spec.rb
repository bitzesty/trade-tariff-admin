require 'rails_helper'

describe SectionNotePolicy do
  subject { SectionNotePolicy }

  permissions :edit? do
    it "grants access to gds editor" do
      should permit(User.new(permissions: [User::Permissions::GDS_EDITOR]), SectionNote.new)
    end

    it "grants access to hmrc editor" do
      should permit(User.new(permissions: [User::Permissions::HMRC_EDITOR]), SectionNote.new)
    end

    it "denies access to regular user with sign in permission" do
      should_not permit(User.new(permissions: [User::Permissions::SIGNIN]), SectionNote.new)
    end
  end
end
