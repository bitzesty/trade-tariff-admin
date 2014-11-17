require 'rails_helper'

describe "Section Note management" do
  let!(:user)   { create :user, :gds_editor }

  before {
    # section note specs do not concern chapters
    stub_api_for(Chapter) { |stub|
      stub.get("/chapters") { |env|
        api_success_response([])
      }
    }
  }

  describe "Section Note creation" do
    let(:section_note) { build :section_note }
    let(:section)      { build :section, title: 'new section' }

    specify do
      stub_api_for(Section) { |stub|
        stub.get("/sections") { |env|
          api_success_response([section.attributes])
        }
        stub.get("/sections/#{section.id}") { |env|
          api_success_response(section.attributes)
        }
      }

      stub_api_for(SectionNote) { |stub|
        stub.post("/sections/#{section.id}/section_note") { |env| api_created_response }
      }

      refute note_created_for(section)

      stub_api_for(Section) { |stub|
        stub.get("/sections") { |env| api_success_response([section.attributes.merge(section_note_id: section_note.id)]) }
        stub.get("/sections/#{section.id}") { |env|
          api_success_response(section.attributes.merge(section_note_id: section_note.id))
        }
      }

      create_note_for section, content: section_note.content

      verify note_created_for(section)
    end
  end

  describe "section Note editing" do
    let(:section)      { build :section, :with_note }
    let(:section_note) { build :section_note, section_id: section.id }
    let(:new_content)  { "new content" }

    specify do
      stub_api_for(Section) { |stub|
        stub.get("/sections") { |env| api_success_response([section.attributes]) }
        stub.get("/sections/#{section.id}") { |env| api_success_response(section.attributes) }
      }

      verify note_created_for(section)

      stub_api_for(SectionNote) { |stub|
        stub.get("/sections/#{section.id}/section_note") { |env| api_success_response(section_note.attributes) }
        stub.put("/sections/#{section.id}/section_note") { |env| api_no_content_response }
      }

      update_note_for section, content: new_content

      stub_api_for(SectionNote) { |stub|
        stub.get("/sections/#{section.id}/section_note") { |env| api_success_response(section_note.attributes.merge(content: new_content)) }
      }

      verify note_updated_for(section, content: new_content)
    end
  end

  describe "Section Note deletion" do
    let(:section)      { build :section, :with_note }
    let(:section_note) { build :section_note, section_id: section.id }

    it 'can be removed' do
      stub_api_for(Section) { |stub|
        stub.get("/sections") { |env| api_success_response([section.attributes]) }
        stub.get("/sections/#{section.id}") { |env| api_success_response(section.attributes) }
      }

      stub_api_for(SectionNote) { |stub|
        stub.get("/sections/#{section.id}/section_note") { |env| api_success_response(section_note.attributes) }
        stub.delete("/sections/#{section.id}/section_note") { |env| api_no_content_response }
      }

      verify note_created_for(section)

      stub_api_for(Section) { |stub|
        stub.get("/sections") { |env| api_success_response([section.attributes.except(:section_note_id)]) }
        stub.get("/sections/#{section.id}") { |env| api_success_response(section.attributes.except(:section_note_id)) }
      }

      remove_note_for section

      refute note_created_for(section)
    end
  end

  private

  def create_note_for(section, fields_and_values = {})
    ensure_on new_notes_section_section_note_path(section)

    fields_and_values.each do |field, value|
      fill_in "section_note_#{field}", with: value
    end

    yield if block_given?

    click_button 'Create Section note'
  end

  def update_note_for(section, fields_and_values = {})
    ensure_on edit_notes_section_section_note_path(section)

    fields_and_values.each do |field, value|
      fill_in "section_note_#{field}", with: value
    end

    yield if block_given?

    click_button 'Update Section note'
  end

  def note_updated_for(section, args = {})
    ensure_on edit_notes_section_section_note_path(section)

    page.has_field?('section_note_content', with: args[:content])
  end

  def note_created_for(section)
    ensure_on root_path

    page.has_selector?(dom_id_selector(section)) && (
      within(dom_id_selector(section)) do
        page.has_link?('Edit')
      end
    )
  end

  def remove_note_for(section)
    ensure_on edit_notes_section_section_note_path(section)

    click_link 'Remove'
  end
end
