require 'spec_helper'

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
    let(:chapter_note) { build :chapter_note }
    let(:chapter)      { build :chapter, title: 'new chapter' }

    specify do
      stub_api_for(Chapter) { |stub|
        stub.get("/chapters") { |env|
          api_success_response([chapter.attributes])
        }
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes)
        }
      }

      stub_api_for(ChapterNote) { |stub|
        stub.post("/chapters/#{chapter.to_param}/chapter_note") { |env| api_created_response }
      }

      refute note_created_for(chapter)

      create_note_for chapter, content: chapter_note.content

      stub_api_for(Chapter) { |stub|
        stub.get("/chapters") { |env| api_success_response([chapter.attributes.merge(chapter_note_id: chapter.to_param)]) }
      }

      verify note_created_for(chapter)
    end
  end

  describe "chapter Note editing" do
    let(:chapter)      { build :chapter, :with_note }
    let(:chapter_note) { build :chapter_note, :persisted, chapter_id: chapter.to_param }
    let(:new_content)  { "new content" }

    specify do
      stub_api_for(Chapter) { |stub|
        stub.get("/chapters") { |env| api_success_response([chapter.attributes]) }
        stub.get("/chapters/#{chapter.to_param}") { |env| api_success_response(chapter.attributes) }
      }

      verify note_created_for(chapter)

      stub_api_for(ChapterNote) { |stub|
        stub.get("/chapters/#{chapter.to_param}/chapter_note") { |env| api_success_response(chapter_note.attributes) }
        stub.put("/chapters/#{chapter.to_param}/chapter_note") { |env| api_no_content_response }
      }

      update_note_for chapter, content: new_content

      stub_api_for(ChapterNote) { |stub|
        stub.get("/chapters/#{chapter.to_param}/chapter_note") { |env| api_success_response(chapter_note.attributes.merge(content: new_content)) }
      }

      verify note_updated_for(chapter, content: new_content)
    end
  end

  describe "Chapter Note deletion" do
    let(:chapter)      { build :chapter, :with_note }
    let(:chapter_note) { build :chapter_note, chapter: chapter }

    specify do
      stub_api_for(Chapter) { |stub|
        stub.get("/chapters") { |env| api_success_response([chapter.attributes]) }
        stub.get("/chapters/#{chapter.to_param}") { |env| api_success_response(chapter.attributes) }
      }

      stub_api_for(ChapterNote) { |stub|
        stub.get("/chapters/#{chapter.to_param}/chapter_note") { |env| api_success_response(chapter_note.attributes) }
        stub.delete("/chapters/#{chapter.to_param}/chapter_note") { |env| api_no_content_response }
      }

      verify note_created_for(chapter)

      remove_note_for chapter

      stub_api_for(Chapter) { |stub|
        stub.get("/chapters") { |env| api_success_response([chapter.attributes.except(:chapter_note_id)]) }
      }

      refute note_created_for(chapter)
    end
  end

  private

  def create_note_for(chapter, fields_and_values = {})
    ensure_on new_chapter_chapter_note_path(chapter)

    fields_and_values.each do |field, value|
      fill_in "chapter_note_#{field}", with: value
    end

    yield if block_given?

    click_button 'Create Chapter note'
  end

  def update_note_for(chapter, fields_and_values = {})
    ensure_on edit_chapter_chapter_note_path(chapter)

    fields_and_values.each do |field, value|
      fill_in "chapter_note_#{field}", with: value
    end

    yield if block_given?

    click_button 'Update Chapter note'
  end

  def remove_note_for(chapter)
    ensure_on root_path

    within(dom_id_selector(chapter)) do
      click_link 'Remove'
    end
  end

  def note_updated_for(chapter, args = {})
    ensure_on edit_chapter_chapter_note_path(chapter)

    page.has_field?('chapter_note_content', with: args[:content])
  end

  def note_created_for(chapter)
    ensure_on root_path

    page.has_selector?(dom_id_selector(chapter)) && (
      within(dom_id_selector(chapter)) do
        page.has_link?('Remove')
      end
    )
  end
end
