require 'spec_helper'

describe "section Note management" do
  let!(:user)    { create :user }
  let!(:section) { create :section, title: 'new section' }

  describe "Section Note creation" do
    let(:section_note) { build :section_note }

    it 'can be created' do
      verify_note_not_created_for section

      create_note note: section_note,
                  section: section

      verify_note_created_for SectionNote.last
    end
  end

  describe "section Note editing" do
    let!(:section_note) { create :section_note }

    it 'can be updated' do
      verify_note_created_for section_note

      update_note note: section_note,
                  content: 'Hello World'

      verify_note_updated_for section_note, content: 'Hello World'
    end
  end

  describe "section Note deletion" do
    let!(:section_note) { create :section_note }

    it 'can be removed' do
      verify_note_created_for section_note

      remove_note section_note

      verify_note_not_created_for section_note.section
    end
  end

  private

  def verify_note_not_created_for(section)
    visit root_path
    page.should_not have_content section.title
  end

  def create_note(args = {})
    visit new_section_note_path

    select args[:section].title, from: 'section_note_section_id'
    fill_in 'section_note_content', with: args[:note].content

    click_button 'Create Section note'
  end

  def update_note(args = {})
    visit edit_section_note_path(args[:note])

    fill_in 'section_note_content', with: args[:content]

    click_button 'Update Section note'
  end

  def remove_note(section_note)
    visit root_path

    within('table.table-section-notes') do
      click_link 'Remove'
    end
  end

  def verify_note_updated_for(section_note, args = {})
    visit edit_section_note_path(section_note)
    page.should have_field('section_note_content', with: args[:content])
  end

  def verify_note_created_for(section_note)
    visit edit_section_note_path(section_note)
    page.should have_field('section_note_section', with: section_note.section.title)
  end
end
