require 'rails_helper'

describe "Chemical management" do
  let!(:user) { create :user, :gds_editor }
  let(:chemical_name_mock_body) {
    {
      data: [
        {
          id: chemical.id,
          type: 'chemical_name',
          attributes: {
            name: chemical.name,
            chemical_id: chemical.id
          }
        }
      ]
    }
  }

  before {
    stub_api_for(Chemical) { |stub|
      stub.get("/admin/chemicals") { |_env|
        jsonapi_success_response('chemical', [])
      }
    }
    stub_request(:get, "http://api.example.org/admin/chemicals/#{chemical.id}/chemical_names").to_return(status: 200, body: chemical_name_mock_body.to_json, headers: {})
  }

  describe "Chemical mapping create" do
    let(:chemical) { build :chemical }
    let(:gn1) { build :commodity }
    let(:gn2) { build :commodity }
    specify do
      stub_api_for(Chemical) { |stub|
        # POST     /admin/chemicals/:chemical_id/map/:goods_nomenclature_sid
        stub.post("/admin/chemicals/#{chemical.id}/map/#{gn1.id}") { |_env|
          jsonapi_success_response('chemical', [chemical_attributes(gn1)])
        }
        # GET     /admin/chemicals/:id
        stub.get("/admin/chemicals/#{chemical.id}") { |_env|
          jsonapi_success_response('chemical', chemical_attributes(gn1))
        }
      }
      refute map_created_for(chemical)

      create_map_for chemical, new_id: gn1.id

      expect(page).to have_content "Mapping for #{gn1.goods_nomenclature_item_id} was created"
      expect(page).to have_content "Commodity #{gn1.goods_nomenclature_item_id}"
    end
  end

  describe "Chemical mapping update" do
    let(:gn1) { build :commodity }
    let(:gn2) { build :commodity }
    let(:chemical) { build :chemical }
    specify do
      stub_api_for(Chemical) { |stub|
        # GET     /admin/chemicals/:id
        stub.get("/admin/chemicals/#{chemical.id}") { |_env|
          jsonapi_success_response('chemical', chemical_attributes(gn1))
        }
      }
      edit_map_for(chemical, gn1.goods_nomenclature_item_id, gn2.goods_nomenclature_item_id) do
        stub_api_for(Chemical) { |stub|
          # PATCH     /admin/chemicals/:chemical_id/map/:goods_nomenclature_item_id
          # PUT       /admin/chemicals/:chemical_id/map/:goods_nomenclature_item_id
          stub.patch("/admin/chemicals/#{chemical.id}/map/#{gn1.id}?#{gn2.goods_nomenclature_item_id}") { |_env|
            jsonapi_success_response('chemical', chemical_attributes(gn2))
          }
          # GET     /admin/chemicals/:id
          stub.get("/admin/chemicals/#{chemical.id}") { |_env|
            jsonapi_success_response('chemical', chemical_attributes(gn2))
          }
          # DELETE /admin/chemicals/:id/map/:goods_nomenclature_item_id
          stub.delete("/admin/chemicals/#{chemical.id}/map/#{gn1.goods_nomenclature_item_id}") { |_env|
            jsonapi_success_response('chemical', chemical_attributes(gn1))
          }
        }
      end

      expect(page).to have_content "Mapping for #{gn2.goods_nomenclature_item_id} was updated"
      expect(page).to have_content "Commodity #{gn2.goods_nomenclature_item_id}"
      expect(page).to have_no_content "Commodity #{gn1.goods_nomenclature_item_id}"
    end
  end

  describe "Chemical mapping delete" do
    let(:gn1) { build :commodity }
    let(:chemical) { build :chemical }
    specify do

      stub_api_for(Chemical) { |stub|
        # GET     /admin/chemicals/:id
        stub.get("/admin/chemicals/#{chemical.id}") { |_env|
          jsonapi_success_response('chemical', chemical_attributes(gn1))
        }
      }

      delete_map_for(chemical, gn1.goods_nomenclature_item_id) do
        stub_api_for(Chemical) { |stub|
          # DELETE     /admin/chemicals/:chemical_id/map/:goods_nomenclature_sid
          stub.delete("/admin/chemicals/#{chemical.id}/map/#{gn1.id}") { |_env|
            jsonapi_success_response('chemical', chemical_attributes(nil))
          }
          # GET     /admin/chemicals/:id
          stub.get("/admin/chemicals/#{chemical.id}") { |_env|
            jsonapi_success_response('chemical', chemical_attributes(nil))
          }
        }

      end

      expect(page).to have_content "Mapping for #{gn1.goods_nomenclature_item_id} was deleted"
      expect(page).to have_no_content "Commodity #{gn1.goods_nomenclature_item_id}"
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

  def edit_map_for(chemical, old_gn, new_gn)
    ensure_on chemical_edit_commodity_mapping_path(chemical)
    fill_in "Commodity #{old_gn}", with: new_gn

    yield if block_given?

    click_button 'Update mapping'
  end

  def delete_map_for(chemical, old_gn)
    ensure_on chemical_edit_commodity_mapping_path(chemical)

    yield if block_given?

    click_button 'Delete mapping'
  end

  def map_created_for(chemical)
    ensure_on chemical_edit_commodity_mapping_path(chemical)
    page.has_selector?("chemical_Update_commodity_mapping_#{gn1.goods_nomenclature_item_id}")
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

  def chemical_attributes(gn)
    {
      "id": "#{chemical.id}",
      "cas": "#{chemical.cas}",
      "name": "#{chemical.name}",
      "goods_nomenclature_map": goods_nomenclature_map(gn)
    }
  end

  def goods_nomenclature_map(gn)
    return nil unless gn

    {
      "#{gn.id}": "#{gn.goods_nomenclature_item_id}"
    }
  end
end
