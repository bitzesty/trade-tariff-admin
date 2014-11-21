require 'rails_helper'

describe ChapterNotePolicy do
  subject { ChapterNotePolicy }

  permissions :edit? do
    it "grants access to gds editor" do
      should permit(User.new(permissions: [User::Permissions::GDS_EDITOR]), ChapterNote.new)
    end

    it "grants access to hmrc editor" do
      should permit(User.new(permissions: [User::Permissions::HMRC_EDITOR]), ChapterNote.new)
    end

    it "denies access to regular user with sign in permission" do
      should_not permit(User.new(permissions: [User::Permissions::SIGNIN]), ChapterNote.new)
    end
  end
end
