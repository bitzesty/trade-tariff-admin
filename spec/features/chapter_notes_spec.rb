require 'rails_helper'

describe "Chapter Note management" do
  let!(:user)   { create :user, :gds_editor }

  before {
    # chapter note specs do not concern sections
    stub_api_for(Section) { |stub|
      stub.get("/sections") { |env|
        api_success_response([])
      }
    }
  }

  describe "Chapter Note creation" do
    let(:section)      { build :section }
    let(:chapter_note) { build :chapter_note }
    let(:chapter)      { build :chapter, :with_section, title: 'new chapter', section: section.attributes }

    specify do
      stub_api_for(Chapter) { |stub|
        stub.get("/sections/#{section.id}/chapters") { |env|
          api_success_response([chapter.attributes])
        }
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes)
        }
      }

      stub_api_for(ChapterNote) { |stub|
        stub.post("/chapters/#{chapter.to_param}/chapter_note") { |env| api_created_response }
      }

      stub_api_for(Section) { |stub|
        stub.get("/sections/#{section.id}") { |env|
          api_success_response(section.attributes)
        }
      }

      refute note_created_for(chapter)

      stub_api_for(Chapter) { |stub|
        stub.get("/sections/#{section.id}/chapters") { |env|
          api_success_response([chapter.attributes.merge(chapter_note_id: 1)])
        }
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes)
        }
      }

      create_note_for chapter, content: chapter_note.content

      verify note_created_for(chapter)
    end
  end

  describe "chapter Note editing" do
    let(:section)      { build :section }
    let(:chapter)      { build :chapter, :with_note, :with_section, section: section.attributes }
    let(:chapter_note) { build :chapter_note, :persisted, chapter_id: chapter.to_param }
    let(:new_content)  { "new content" }

    specify do
      stub_api_for(Chapter) { |stub|
        stub.get("/sections/#{section.id}/chapters") { |env|
          api_success_response([chapter.attributes])
        }
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes)
        }
      }

      stub_api_for(Section) { |stub|
        stub.get("/sections/#{section.id}") { |env|
          api_success_response(section.attributes)
        }
      }

      stub_api_for(ChapterNote) { |stub|
        stub.get("/chapters/#{chapter.to_param}/chapter_note") { |env|
          api_success_response(chapter_note.attributes)
        }

        stub.put("/chapters/#{chapter.to_param}/chapter_note") { |env|
          api_no_content_response
        }
      }

      verify note_created_for(chapter)

      update_note_for chapter, content: new_content

      stub_api_for(ChapterNote) { |stub|
        stub.get("/chapters/#{chapter.to_param}/chapter_note") { |env|
          api_success_response(chapter_note.attributes.merge(content: new_content))
        }
      }

      verify note_updated_for(chapter, content: new_content)
    end
  end

  describe "Chapter Note deletion" do
    let(:section)      { build :section }
    let(:chapter)      { build :chapter, :with_note, :with_section, section: section.attributes }
    let(:chapter_note) { build :chapter_note, :persisted, chapter_id: chapter.to_param }

    specify do
      stub_api_for(Section) { |stub|
        stub.get("/sections/#{section.id}") { |env|
          api_success_response(section.attributes)
        }
      }

      stub_api_for(Chapter) { |stub|
        stub.get("/sections/#{section.id}/chapters") { |env|
          api_success_response([chapter.attributes])
        }
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes)
        }
      }

      stub_api_for(ChapterNote) { |stub|
        stub.get("/chapters/#{chapter.to_param}/chapter_note") { |env| api_success_response(chapter_note.attributes) }
        stub.delete("/chapters/#{chapter.to_param}/chapter_note") { |env| api_no_content_response }
      }

      verify note_created_for(chapter)

      stub_api_for(Chapter) { |stub|
        stub.get("/sections/#{section.id}/chapters") { |env|
          api_success_response([chapter.attributes.except(:chapter_note_id)])
        }
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes.except(:chapter_note_id))
        }
      }

      remove_note_for chapter

      refute note_created_for(chapter)
    end
  end

  private

  def create_note_for(chapter, fields_and_values = {})
    ensure_on new_notes_chapter_chapter_note_path(chapter)

    fields_and_values.each do |field, value|
      fill_in "chapter_note_#{field}", with: value
    end

    yield if block_given?

    click_button 'Create Chapter note'
  end

  def update_note_for(chapter, fields_and_values = {})
    ensure_on edit_notes_chapter_chapter_note_path(chapter)

    fields_and_values.each do |field, value|
      fill_in "chapter_note_#{field}", with: value
    end

    yield if block_given?

    click_button 'Update Chapter note'
  end

  def note_updated_for(chapter, args = {})
    ensure_on edit_notes_chapter_chapter_note_path(chapter)

    page.has_field?('chapter_note_content', with: args[:content])
  end

  def note_created_for(chapter)
    ensure_on notes_section_chapters_path(section_id: chapter.section[:id])

    page.has_selector?(dom_id_selector(chapter)) && (
      within(dom_id_selector(chapter)) do
        page.has_link?('Edit')
      end
    )
  end

  def remove_note_for(chapter)
    ensure_on edit_notes_chapter_chapter_note_path(chapter)

    click_link 'Remove'
  end
end
