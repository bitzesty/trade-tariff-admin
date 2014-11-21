require 'rails_helper'
require 'search_reference'

describe "Section Search Reference management" do
  let!(:user)   { create :user, :gds_editor }

  before {
    # section note specs do not concern sections
    stub_api_for(Section) { |stub|
      stub.get("/sections") { |env|
        api_success_response([])
      }
    }
  }

  describe "Search Reference creation" do
    let(:title)        { 'new title' }
    let(:section_search_reference) { attributes_for :section_search_reference, title: title }
    let(:section)      { build :section, title: 'new section' }

    specify do
      stub_api_for(Section) { |stub|
        stub.get("/sections/#{section.to_param}") { |env|
          api_success_response(section.attributes)
        }
      }

      stub_api_for(Section::SearchReference) { |stub|
        stub.get("/sections/#{section.to_param}/search_references") { |env|
          api_success_response([], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      refute search_reference_created_for(section, title: title)

      stub_api_for(Section::SearchReference) { |stub|
        stub.post("/sections/#{section.to_param}/search_references") { |env|
          api_created_response
        }

        stub.get("/sections/#{section.to_param}/search_references") { |env|
          api_success_response([section_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      create_search_reference_for section, title: title

      verify search_reference_created_for(section, title: title)
    end
  end

  describe "Search Reference deletion" do
    let(:section)                  { build :section }
    let(:section_search_reference) { build :section_search_reference, referenced: section.attributes }

    specify do
      stub_api_for(Section) { |stub|
        stub.get("/sections/#{section.to_param}") { |env|
          api_success_response(section.attributes)
        }
      }

      stub_api_for(Section::SearchReference) { |stub|
        stub.get("/sections/#{section.to_param}/search_references") { |env|
          api_success_response([section_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      verify search_reference_created_for(section, title: section_search_reference[:title])

      stub_api_for(Section::SearchReference) { |stub|
        stub.get("/sections/#{section.to_param}/search_references/#{section_search_reference.to_param}") { |env|
          api_success_response(section_search_reference)
        }
        stub.delete("/sections/#{section.to_param}/search_references/#{section_search_reference.to_param}") { |env|
          api_no_content_response
        }
        stub.get("/sections/#{section.to_param}/search_references") { |env|
          api_success_response([], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      remove_section_search_reference_for(section, section_search_reference)

      refute search_reference_created_for(section, title: section_search_reference[:title])
    end
  end

  describe "Search reference editing" do
    let(:section)                  { build :section }
    let(:section_search_reference) { build :section_search_reference, referenced: section.attributes }
    let(:new_title)  { "new title" }

    specify do
      stub_api_for(Section) { |stub|
        stub.get("/sections/#{section.to_param}") { |env|
          api_success_response(section.attributes)
        }
      }

      stub_api_for(Section::SearchReference) { |stub|
        stub.get("/sections/#{section.to_param}/search_references") { |env|
          api_success_response([section_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      verify search_reference_created_for(section, title: section_search_reference[:title])

      stub_api_for(Section::SearchReference) { |stub|
        stub.get("/sections/#{section.to_param}/search_references/#{section_search_reference.to_param}") { |env|
          api_success_response(section_search_reference)
        }
        stub.put("/sections/#{section.to_param}/search_references/#{section_search_reference.to_param}") { |env|
          api_no_content_response
        }
        stub.get("/sections/#{section.to_param}/search_references") { |env|
          api_success_response([section_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      update_section_search_reference_for(section, section_search_reference, title: new_title)

      stub_api_for(Section::SearchReference) { |stub|
        stub.get("/sections/#{section.to_param}/search_references/#{section_search_reference.to_param}") { |env|
          api_success_response(section_search_reference.attributes.merge(title: new_title))
        }
      }

      verify section_search_reference_updated_for(section, section_search_reference, title: new_title)
    end
  end

  private

  def create_search_reference_for(section, fields_and_values = {})
    ensure_on new_synonyms_section_search_reference_path(section)

    fields_and_values.each do |field, value|
      fill_in "search_reference_#{field}", with: value
    end

    yield if block_given?

    click_button 'Create Search reference'
  end

  def update_section_search_reference_for(section, search_reference, fields_and_values = {})
    ensure_on edit_synonyms_section_search_reference_path(section, search_reference)

    fields_and_values.each do |field, value|
      fill_in "search_reference_#{field}", with: value
    end

    yield if block_given?

    click_button 'Update Search reference'
  end

  def remove_section_search_reference_for(section, section_search_reference)
    ensure_on synonyms_section_search_references_path(section)

    within(dom_id_selector(section_search_reference)) do
      click_link 'Remove'
    end
  end

  def section_search_reference_updated_for(section, search_reference, args = {})
    ensure_on edit_synonyms_section_search_reference_path(section, search_reference)

    page.has_field?('search_reference_title', with: args[:title])
  end

  def search_reference_created_for(section, attributes = {})
    ensure_on synonyms_section_search_references_path(section)

    within("table") do
      page.has_content? attributes.fetch(:title)
    end
  end
end
