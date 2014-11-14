require 'rails_helper'
require 'search_reference'

describe "Commodity Search Reference management" do
  let!(:user)   { create :user, :gds_editor }
  let(:heading) { build :heading }

  describe "Search Reference creation" do
    let(:title)        { 'new title' }
    let(:commodity)    { build :commodity, title: 'new commodity', heading: heading }
    let(:commodity_search_reference) { build :commodity_search_reference, title: title, referenced: commodity.attributes }

    specify do
      stub_api_for(Commodity) { |stub|
        stub.get("/commodities/#{commodity.to_param}") { |env|
          api_success_response(commodity.attributes)
        }
      }

      stub_api_for(Commodity::SearchReference) { |stub|
        stub.get("/commodities/#{commodity.to_param}/search_references") { |env|
          api_success_response([], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      refute search_reference_created_for(commodity, title: title)

      stub_api_for(Commodity::SearchReference) { |stub|
        stub.post("/commodities/#{commodity.to_param}/search_references") { |env|
          api_created_response
        }

        stub.get("/commodities/#{commodity.to_param}/search_references") { |env|
          api_success_response([commodity_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      create_search_reference_for commodity, title: title

      verify search_reference_created_for(commodity, title: title)
    end
  end

  describe "Search Reference deletion" do
    let(:commodity)                  { build :commodity, :with_heading, heading: heading.attributes }
    let(:commodity_search_reference) { build :commodity_search_reference, referenced: commodity.attributes }

    specify do
      stub_api_for(Commodity) { |stub|
        stub.get("/commodities/#{commodity.to_param}") { |env|
          api_success_response(commodity.attributes)
        }
      }

      stub_api_for(Commodity::SearchReference) { |stub|
        stub.get("/commodities/#{commodity.to_param}/search_references") { |env|
          api_success_response([commodity_search_reference.attributes], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      verify search_reference_created_for(commodity, title: commodity_search_reference[:title])

      stub_api_for(Commodity::SearchReference) { |stub|
        stub.get("/commodities/#{commodity.to_param}/search_references/#{commodity_search_reference.to_param}") { |env|
          api_success_response(commodity_search_reference)
        }
        stub.delete("/commodities/#{commodity.to_param}/search_references/#{commodity_search_reference.to_param}") { |env|
          api_no_content_response
        }
        stub.get("/commodities/#{commodity.to_param}/search_references") { |env|
          api_success_response([], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      remove_commodity_search_reference_for(commodity, commodity_search_reference)

      refute search_reference_created_for(commodity, title: commodity_search_reference[:title])
    end
  end

  describe "Search reference editing" do
    let(:commodity)                  { build :commodity, :with_heading, heading: heading }
    let(:commodity_search_reference) { build :commodity_search_reference, referenced: commodity.attributes }
    let(:new_title)  { "new title" }

    specify do
      stub_api_for(Commodity) { |stub|
        stub.get("/commodities/#{commodity.to_param}") { |env|
          api_success_response(commodity.attributes)
        }
      }

      stub_api_for(Commodity::SearchReference) { |stub|
        stub.get("/commodities/#{commodity.to_param}/search_references") { |env|
          api_success_response([commodity_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      verify search_reference_created_for(commodity, title: commodity_search_reference[:title])

      stub_api_for(Commodity::SearchReference) { |stub|
        stub.get("/commodities/#{commodity.to_param}/search_references/#{commodity_search_reference.to_param}") { |env|
          api_success_response(commodity_search_reference)
        }
        stub.put("/commodities/#{commodity.to_param}/search_references/#{commodity_search_reference.to_param}") { |env|
          api_no_content_response
        }
        stub.get("/commodities/#{commodity.to_param}/search_references") { |env|
          api_success_response([commodity_search_reference], { 'x-meta' => { pagination: { total: 1 } }.to_json })
        }
      }

      update_commodity_search_reference_for(commodity, commodity_search_reference, title: new_title)

      stub_api_for(Commodity::SearchReference) { |stub|
        stub.get("/commodities/#{commodity.to_param}/search_references/#{commodity_search_reference.to_param}") { |env|
          api_success_response(commodity_search_reference.attributes.merge(title: new_title))
        }
      }

      verify commodity_search_reference_updated_for(commodity, commodity_search_reference, title: new_title)
    end
  end

  private

  def create_search_reference_for(commodity, fields_and_values = {})
    ensure_on new_synonyms_commodity_search_reference_path(commodity)

    fields_and_values.each do |field, value|
      fill_in "search_reference_#{field}", with: value
    end

    yield if block_given?

    click_button 'Create Search reference'
  end

  def update_commodity_search_reference_for(commodity, search_reference, fields_and_values = {})
    ensure_on edit_synonyms_commodity_search_reference_path(commodity, search_reference)

    fields_and_values.each do |field, value|
      fill_in "search_reference_#{field}", with: value
    end

    yield if block_given?

    click_button 'Update Search reference'
  end

  def remove_commodity_search_reference_for(commodity, commodity_search_reference)
    ensure_on synonyms_commodity_search_references_path(commodity)

    within(dom_id_selector(commodity_search_reference)) do
      click_link 'Remove'
    end
  end

  def commodity_search_reference_updated_for(commodity, search_reference, args = {})
    ensure_on edit_synonyms_commodity_search_reference_path(commodity, search_reference)

    page.has_field?('search_reference_title', with: args[:title])
  end

  def search_reference_created_for(commodity, attributes = {})
    ensure_on synonyms_commodity_search_references_path(commodity)

    within("table") do
      page.has_content? attributes.fetch(:title)
    end
  end
end
