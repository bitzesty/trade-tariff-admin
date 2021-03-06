require 'rails_helper'
require 'search_reference'

describe "Heading Search Reference management" do
  let!(:user)   { create :user, :gds_editor }
  let(:chapter) { build :chapter }

  describe "Search Reference creation" do
    let(:title)        { 'new title' }
    let(:heading)      { build :heading, title: 'new heading', chapter: { type: 'chapter', id: chapter.id, attributes: chapter.attributes } }
    let(:heading_search_reference) { build :heading_search_reference, title: title, referenced: heading.attributes }

    specify do
      stub_api_for(Heading) { |stub|
        stub.get("/admin/headings/#{heading.to_param}") { |_env|
          jsonapi_success_response('heading', heading.attributes)
        }
      }

      stub_api_for(Heading::SearchReference) { |stub|
        stub.get("/admin/headings/#{heading.to_param}/search_references") { |_env|
          jsonapi_success_response('search_reference', [], 'x-meta' => { pagination: { total: 1 } }.to_json)
        }
      }

      refute search_reference_created_for(heading, title: title)

      stub_api_for(Heading::SearchReference) { |stub|
        stub.post("/admin/headings/#{heading.to_param}/search_references") { |_env|
          api_created_response
        }

        stub.get("/admin/headings/#{heading.to_param}/search_references") { |_env|
          jsonapi_success_response('search_reference', [heading_search_reference.attributes], 'x-meta' => { pagination: { total: 1 } }.to_json)
        }
      }

      create_search_reference_for heading, title: title

      verify search_reference_created_for(heading, title: title)
    end
  end

  describe "Search Reference deletion" do
    let(:heading)                  { build :heading, :with_chapter, chapter: { type: 'chapter', id: chapter.id, attributes: chapter.attributes } }
    let(:heading_search_reference) { build :heading_search_reference, referenced: heading.attributes }

    specify do
      stub_api_for(Heading) { |stub|
        stub.get("/admin/headings/#{heading.to_param}") { |_env|
          jsonapi_success_response('heading', heading.attributes)
        }
      }

      stub_api_for(Heading::SearchReference) { |stub|
        stub.get("/admin/headings/#{heading.to_param}/search_references") { |_env|
          jsonapi_success_response('heading', [heading_search_reference.attributes], 'x-meta' => { pagination: { total: 1 } }.to_json)
        }
      }

      verify search_reference_created_for(heading, title: heading_search_reference[:title])

      stub_api_for(Heading::SearchReference) { |stub|
        stub.get("/admin/headings/#{heading.to_param}/search_references/#{heading_search_reference.to_param}") { |_env|
          jsonapi_success_response('search_reference', heading_search_reference.attributes)
        }
        stub.delete("/admin/headings/#{heading.to_param}/search_references/#{heading_search_reference.to_param}") { |_env|
          api_no_content_response
        }
        stub.get("/admin/headings/#{heading.to_param}/search_references") { |_env|
          jsonapi_success_response('search_reference', [], 'x-meta' => { pagination: { total: 1 } }.to_json)
        }
      }

      remove_heading_search_reference_for(heading, heading_search_reference)

      refute search_reference_created_for(heading, title: heading_search_reference[:title])
    end
  end

  describe "Search reference editing" do
    let(:heading)                  { build :heading, :with_chapter, chapter: { type: 'chapter', id: chapter.id, attributes: chapter.attributes } }
    let(:heading_search_reference) { build :heading_search_reference, referenced: heading.attributes }
    let(:new_title) { "new title" }

    specify do
      stub_api_for(Heading) { |stub|
        stub.get("/admin/headings/#{heading.to_param}") { |_env|
          jsonapi_success_response('heading', heading.attributes)
        }
      }

      stub_api_for(Heading::SearchReference) { |stub|
        stub.get("/admin/headings/#{heading.to_param}/search_references") { |_env|
          jsonapi_success_response('search_reference', [heading_search_reference.attributes], 'x-meta' => { pagination: { total: 1 } }.to_json)
        }
      }

      verify search_reference_created_for(heading, title: heading_search_reference[:title])

      stub_api_for(Heading::SearchReference) { |stub|
        stub.get("/admin/headings/#{heading.to_param}/search_references/#{heading_search_reference.to_param}") { |_env|
          jsonapi_success_response('search_reference', heading_search_reference.attributes)
        }
        stub.patch("/admin/headings/#{heading.to_param}/search_references/#{heading_search_reference.to_param}") { |_env|
          api_no_content_response
        }
        stub.get("/admin/headings/#{heading.to_param}/search_references") { |_env|
          jsonapi_success_response('search_reference', [heading_search_reference.attributes], 'x-meta' => { pagination: { total: 1 } }.to_json)
        }
      }

      update_heading_search_reference_for(heading, heading_search_reference, title: new_title)

      stub_api_for(Heading::SearchReference) { |stub|
        stub.get("/admin/headings/#{heading.to_param}/search_references/#{heading_search_reference.to_param}") { |_env|
          jsonapi_success_response('search_reference', heading_search_reference.attributes.merge(title: new_title))
        }
      }

      verify heading_search_reference_updated_for(heading, heading_search_reference, title: new_title)
    end
  end

  private

  def create_search_reference_for(heading, fields_and_values = {})
    ensure_on new_synonyms_heading_search_reference_path(heading)

    fields_and_values.each do |field, value|
      fill_in "search_reference_#{field}", with: value
    end

    yield if block_given?

    click_button 'Create Search reference'
  end

  def update_heading_search_reference_for(heading, search_reference, fields_and_values = {})
    ensure_on edit_synonyms_heading_search_reference_path(heading, search_reference)

    fields_and_values.each do |field, value|
      fill_in "search_reference_#{field}", with: value
    end

    yield if block_given?

    click_button 'Update Search reference'
  end

  def remove_heading_search_reference_for(heading, heading_search_reference)
    ensure_on synonyms_heading_search_references_path(heading)

    within(dom_id_selector(heading_search_reference)) do
      click_link 'Remove'
    end
  end

  def heading_search_reference_updated_for(heading, search_reference, args = {})
    ensure_on edit_synonyms_heading_search_reference_path(heading, search_reference)

    page.has_field?('search_reference_title', with: args[:title])
  end

  def search_reference_created_for(heading, attributes = {})
    ensure_on synonyms_heading_search_references_path(heading)

    within("table") do
      page.has_content? attributes.fetch(:title)
    end
  end
end
