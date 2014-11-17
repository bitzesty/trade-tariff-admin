require 'rails_helper'
require 'search_reference'

describe "Chapter Search Reference management" do
  let!(:user)   { create :user, :gds_editor }
  let(:section) { build :section }

  describe "Search Reference creation" do
    let(:title)        { 'new title' }
    let(:chapter_search_reference) { attributes_for :chapter_search_reference, title: title }
    let(:section)      { build :section }
    let(:chapter)      { build :chapter, :with_section, title: 'new chapter', section: section.attributes }

    specify do
      stub_api_for(Chapter) { |stub|
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes)
        }
      }

      stub_api_for(Chapter::SearchReference) { |stub|
        stub.get("/chapters/#{chapter.to_param}/search_references") { |env|
          api_success_response([], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      refute search_reference_created_for(chapter, title: title)

      stub_api_for(Chapter::SearchReference) { |stub|
        stub.post("/chapters/#{chapter.to_param}/search_references") { |env|
          api_created_response
        }

        stub.get("/chapters/#{chapter.to_param}/search_references") { |env|
          api_success_response([chapter_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      create_search_reference_for chapter, title: title

      verify search_reference_created_for(chapter, title: title)
    end
  end

  describe "Search Reference deletion" do
    let(:chapter)                  { build :chapter, :with_section, section: section.attributes }
    let(:chapter_search_reference) { build :chapter_search_reference, referenced: chapter.attributes }

    specify do
      stub_api_for(Chapter) { |stub|
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes)
        }
      }

      stub_api_for(Chapter::SearchReference) { |stub|
        stub.get("/chapters/#{chapter.to_param}/search_references") { |env|
          api_success_response([chapter_search_reference.attributes], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      verify search_reference_created_for(chapter, title: chapter_search_reference[:title])

      stub_api_for(Chapter::SearchReference) { |stub|
        stub.get("/chapters/#{chapter.to_param}/search_references/#{chapter_search_reference.to_param}") { |env|
          api_success_response(chapter_search_reference)
        }
        stub.delete("/chapters/#{chapter.to_param}/search_references/#{chapter_search_reference.to_param}") { |env|
          api_no_content_response
        }
        stub.get("/chapters/#{chapter.to_param}/search_references") { |env|
          api_success_response([], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      remove_chapter_search_reference_for(chapter, chapter_search_reference)

      refute search_reference_created_for(chapter, title: chapter_search_reference[:title])
    end
  end

  describe "Search reference editing" do
    let(:section)                  { build :section }
    let(:chapter)                  { build :chapter, :with_section, section: section.attributes }
    let(:chapter_search_reference) { build :chapter_search_reference, referenced: chapter.attributes }
    let(:new_title)  { "new title" }

    specify do
      stub_api_for(Chapter) { |stub|
        stub.get("/chapters/#{chapter.to_param}") { |env|
          api_success_response(chapter.attributes)
        }
      }

      stub_api_for(Chapter::SearchReference) { |stub|
        stub.get("/chapters/#{chapter.to_param}/search_references") { |env|
          api_success_response([chapter_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      verify search_reference_created_for(chapter, title: chapter_search_reference[:title])

      stub_api_for(Chapter::SearchReference) { |stub|
        stub.get("/chapters/#{chapter.to_param}/search_references/#{chapter_search_reference.to_param}") { |env|
          api_success_response(chapter_search_reference)
        }
        stub.put("/chapters/#{chapter.to_param}/search_references/#{chapter_search_reference.to_param}") { |env|
          api_no_content_response
        }
        stub.get("/chapters/#{chapter.to_param}/search_references") { |env|
          api_success_response([chapter_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      update_chapter_search_reference_for(chapter, chapter_search_reference, title: new_title)

      stub_api_for(Chapter::SearchReference) { |stub|
        stub.get("/chapters/#{chapter.to_param}/search_references/#{chapter_search_reference.to_param}") { |env|
          api_success_response(chapter_search_reference.attributes.merge(title: new_title))
        }
      }

      verify chapter_search_reference_updated_for(chapter, chapter_search_reference, title: new_title)
    end
  end

  private

  def create_search_reference_for(chapter, fields_and_values = {})
    ensure_on new_synonyms_chapter_search_reference_path(chapter)

    fields_and_values.each do |field, value|
      fill_in "search_reference_#{field}", with: value
    end

    yield if block_given?

    click_button 'Create Search reference'
  end

  def update_chapter_search_reference_for(chapter, search_reference, fields_and_values = {})
    ensure_on edit_synonyms_chapter_search_reference_path(chapter, search_reference)

    fields_and_values.each do |field, value|
      fill_in "search_reference_#{field}", with: value
    end

    yield if block_given?

    click_button 'Update Search reference'
  end

  def remove_chapter_search_reference_for(chapter, chapter_search_reference)
    ensure_on synonyms_chapter_search_references_path(chapter)

    within(dom_id_selector(chapter_search_reference)) do
      click_link 'Remove'
    end
  end

  def chapter_search_reference_updated_for(chapter, search_reference, args = {})
    ensure_on edit_synonyms_chapter_search_reference_path(chapter, search_reference)

    page.has_field?('search_reference_title', with: args[:title])
  end

  def search_reference_created_for(chapter, attributes = {})
    ensure_on synonyms_chapter_search_references_path(chapter)

    within("table") do
      page.has_content? attributes.fetch(:title)
    end
  end
end
