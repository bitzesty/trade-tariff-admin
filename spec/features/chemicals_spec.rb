require 'rails_helper'

describe "Chemical mapping management" do
  let!(:user) { create :user, :gds_editor }

  before {
    stub_api_for(Chemical) { |stub|
      stub.get("/admin/chemicals") { |_env|
        jsonapi_success_response('chemical', [])
      }
    }
  }

  # GET    /admin/chemicals/:chemical_id/map(.:format)        
  # GET    /admin/chemicals(.:format)                         
  # GET    /admin/chemicals/:id(.:format)                       

  # POST   /admin/chemicals/:chemical_id/map/:gn_id(.:format)
  describe "Chemical mapping creation" do
    let(:chemical) { build :chemical }
    let(:gn1) { build :commodity }
    let(:gn2) { build :commodity }
    specify do
      stub_api_for(Chemical) { |stub|
        stub.post("/admin/chemicals/#{chemical .id}/map/#{gn1.id}") { |_env|
          jsonapi_success_response('chemical', [chemical.attributes])
        }
        stub.get("/admin/chemicals/#{chemical.id}") { |_env|
          jsonapi_success_response('chemical', chemical.attributes)
        }
      }
      refute map_created_for(chemical)

      create_map_for chemical, new_id: gn1.id

      expect(page).to have_content "Mapping for #{gn1.goods_nomenclature_item_id} was created"
    end
  end

  # PATCH  /admin/chemicals/:chemical_id/map/:gn_id(.:format)
  # POST   /admin/chemicals/:chemical_id/map/:gn_id(.:format) 
  describe "Chemical mapping update" do
    let(:chemical) { build :chemical }
    let(:gn1) { build :commodity }
    let(:gn2) { build :commodity }
    xspecify do
      stub_api_for(Chemical) { |stub|
        stub.post("/admin/chemicals/#{chemical .id}/map/#{gn1.id}") { |_env|
          jsonapi_success_response('chemical', [chemical.attributes])
        }
        stub.get("/admin/chemicals/#{chemical.id}") { |_env|
          jsonapi_success_response('chemical', chemical.attributes)
        }
      }

      update_map_for(chemical, gn1.goods_nomenclature_item_id, gn1.goods_nomenclature_item_id)
    
      expect(page).to have_content "Commodity #{gn2.goods_nomenclature_item_id}"
      expect(page).to.not have_content "Commodity #{gn1.goods_nomenclature_item_id}"
    end
  end

  private

  def create_map_for(chemical, fields_and_values = {})
    ensure_on chemical_new_commodity_mapping_path(chemical)

    fields_and_values.each do |field, value|
      fill_in "chemical_#{field}", with: value
    end

    yield if block_given?

    click_button 'Add mapping'
  end

  def update_map_for(chemical, old_gn, new_gn)
    ensure_on chemical_edit_commodity_mapping_path(chemical)

    fill_in "Commodity #{old_gn}", with: new_gn

    yield if block_given?

    click_button 'Update mapping'
  end

  def map_created_for(chemical)
    ensure_on chemical_edit_commodity_mapping_path(chemical)
    page.has_selector?("chemical_Update_commodity_mapping_#{gn1.goods_nomenclature_item_id}")
  end
end
