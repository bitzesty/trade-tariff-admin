require 'spec_helper'

describe "section Note management" do
  let!(:user)   { create :user }
  let(:section) { build :section, title: 'new section' }

  describe "Section Note creation" do
    let(:section_note) { build :section_note }

    it 'can be created' do
      stub_api_for(Section) { |stub|
        stub.get("/sections") { |env| api_response_success([section.attributes]) }
        stub.get("/sections/#{section.id}") { |env| api_response_success(section) }
      }

      stub_api_for(Chapter) { |stub|
        stub.get("/chapters") { |env| api_response_success([]) }
      }

      stub_api_for(SectionNote) { |stub|
        stub.post("/sections/#{section.id}/section_note") { |env| [201, {}, {}.to_json] }
      }

      refute note_created_for(section)

      create_note_for section, content: section_note.content

      stub_api_for(Section) { |stub|
        stub.get("/sections") { |env| api_response_success([section.attributes.merge(section_note_id: section_note.id)]) }
      }

      verify note_created_for(section)
    end
  end

  pending "section Note editing" do
    let!(:section_note) { create :section_note }

    it 'can be updated' do
      verify_note_created_for section_note

      update_note note: section_note

      verify_note_updated_for section_note, content: 'Hello World'
    end
  end

  pending "section Note deletion" do
    let!(:section_note) { create :section_note }

    it 'can be removed' do
      verify_note_created_for section_note

      remove_note section_note

      verify_note_not_created_for section_note.section
    end
  end

  private

  def create_note_for(section, fields_and_values = {})
    ensure_on new_section_section_note_path(section)

    fields_and_values.each do |field, value|
      fill_in "section_note_#{field}", with: value
    end

    yield if block_given?

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

  def note_created_for(section)
    ensure_on root_path

    within(dom_id_selector(section)) do
      page.has_link?('Remove')
    end
  end
end
