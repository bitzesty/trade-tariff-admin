require 'rails_helper'

describe 'Chemical management' do
  let!(:user) { create :user, :gds_editor }
  let(:chemical_name_mock_body) do
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
  end

  before do
    stub_api_for(Chemical) do |stub|
      stub.get('/admin/chemicals') do |_env|
        jsonapi_success_response('chemical', [])
      end
    end
    stub_request(:get, "http://api.example.org/admin/chemicals/#{chemical.id}/chemical_names").to_return(status: 200, body: chemical_name_mock_body.to_json, headers: {})
  end

  describe 'Chemical mapping create' do
    let(:chemical) { build :chemical }
    let(:gn1) { build :commodity }
    let(:gn2) { build :commodity }
    specify do
      stub_api_for(Chemical) do |stub|
        stub.post("/admin/chemicals/#{chemical.id}/map/#{gn1.id}") do |_env|
          jsonapi_success_response('chemical', [chemical_attributes(gn1)])
        end
        stub.get("/admin/chemicals/#{chemical.id}") do |_env|
          jsonapi_success_response('chemical', chemical_attributes(gn1))
        end
      end
      refute map_created_for(chemical)

      create_map_for chemical, goods_nomenclature_item_id: gn1.id

      expect(page).to have_content "Mapping for #{gn1.goods_nomenclature_item_id} was created"
      expect(page).to have_content "Commodity #{gn1.goods_nomenclature_item_id}"
    end
  end

  describe 'Chemical mapping update' do
    let(:gn1) { build :commodity }
    let(:gn2) { build :commodity }
    let(:chemical) { build :chemical }
    specify do
      stub_api_for(Chemical) do |stub|
        stub.get("/admin/chemicals/#{chemical.id}") do |_env|
          jsonapi_success_response('chemical', chemical_attributes(gn1))
        end
      end
      edit_map_for(chemical, gn1.goods_nomenclature_item_id, gn2.goods_nomenclature_item_id) do
        stub_api_for(Chemical) do |stub|
          stub.patch("/admin/chemicals/#{chemical.id}/map/#{gn1.id}?goods_nomenclature_item_id=#{gn2.goods_nomenclature_item_id}") do |_env|
            jsonapi_success_response('chemical', chemical_attributes(gn2))
          end
          stub.get("/admin/chemicals/#{chemical.id}") do |_env|
            jsonapi_success_response('chemical', chemical_attributes(gn2))
          end
        end
      end

      expect(page).to have_content "Mapping for #{gn2.goods_nomenclature_item_id} was updated"
      expect(page).to have_content "Commodity #{gn2.goods_nomenclature_item_id}"
      expect(page).to have_no_content "Commodity #{gn1.goods_nomenclature_item_id}"
    end
  end

  describe 'Chemical mapping delete' do
    let(:gn1) { build :commodity }
    let(:chemical) { build :chemical }
    specify do
      stub_api_for(Chemical) do |stub|
        stub.get("/admin/chemicals/#{chemical.id}") do |_env|
          jsonapi_success_response('chemical', chemical_attributes(gn1))
        end
      end

      delete_map_for(chemical) do
        stub_api_for(Chemical) do |stub|
          stub.delete("/admin/chemicals/#{chemical.id}/map/#{gn1.id}") do |_env|
            jsonapi_success_response('chemical', chemical_attributes(nil))
          end
          stub.get("/admin/chemicals/#{chemical.id}") do |_env|
            jsonapi_success_response('chemical', chemical_attributes(nil))
          end
        end
      end

      expect(page).to have_content "Mapping for #{gn1.goods_nomenclature_item_id} was deleted"
      expect(page).to have_no_content "Commodity #{gn1.goods_nomenclature_item_id}"
    end
  end

  describe 'Chemical create' do
    let(:gn1) { build :commodity }
    let(:chemical) { build :chemical }
    specify do
      stub_api_for(Chemical) do |stub|
        stub.get('/admin/chemicals') do |_env|
          jsonapi_success_response('chemicals', [chemical_attributes(gn1)])
        end
      end
      new_cas = '7-7-7'
      new_name = 'Unotainium'
      create_for(chemical, new_cas, new_name) do
        stub_api_for(Chemical) do |stub|
          stub.post('/admin/chemicals', { data: { type: 'chemicals', attributes: { cas: new_cas, name: new_name } } }) do |_env|
            jsonapi_success_response('chemical', chemical_attributes(nil))
          end
          stub.get("/admin/chemicals/#{chemical.id}") do |_env|
            jsonapi_success_response('chemical', chemical_attributes(nil))
          end
        end
      end

      expect(page).to have_content 'Chemical was created'
    end
  end

  describe 'Chemical update' do
    let(:gn1) { build :commodity }
    let(:chemical) { build :chemical }
    specify do
      stub_api_for(Chemical) do |stub|
        stub.get('/admin/chemicals') do |_env|
          jsonapi_success_response('chemicals', [chemical_attributes(gn1)])
        end
        stub.get("/admin/chemicals/#{chemical.id}") do |_env|
          jsonapi_success_response('chemical', chemical_attributes(gn1))
        end
      end
      new_cas = '6-6-6'
      new_name = 'Kyber (crystal)'
      update_for(chemical, new_cas, new_name) do
        stub_api_for(Chemical) do |stub|
          stub.patch("/admin/chemicals/#{chemical.id}?cas=#{new_cas}") do |_env|
            jsonapi_success_response('chemical', chemical_attributes(gn1))
          end
          stub.patch("/admin/chemicals/#{chemical.id}?chemical_name_id=#{chemical.chemical_names.first.id}&new_chemical_name=#{new_name}") do |_env|
            jsonapi_success_response('chemical', chemical_attributes(gn1))
          end
          stub.get("/admin/chemicals/#{chemical.id}") do |_env|
            jsonapi_success_response('chemical', chemical_attributes(gn1))
          end
        end
      end

      expect(page).to have_content "Chemical #{chemical.cas} was updated"
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

  def delete_map_for(chemical)
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

    yield if block_given?

    fill_in "Commodity #{old_gn}", with: new_gn
    click_button 'Update mapping'
  end

  def create_for(_chemical, new_cas, new_name)
    ensure_on chemicals_path

    fill_in 'CAS number', with: new_cas
    fill_in 'Name', with: new_name

    yield if block_given?

    click_button 'Create new chemical'
  end

  def update_for(chemical, new_cas, new_name)
    ensure_on chemical_edit_commodity_mapping_path(chemical)

    yield if block_given?

    fill_in 'CAS Number', with: new_cas
    click_button 'Update chemical'

    fill_in 'Name', with: new_name
    click_button 'Update name'
  end

  def map_created_for(chemical)
    ensure_on chemical_edit_commodity_mapping_path(chemical)
    page.has_selector?("chemical_Update_commodity_mapping_#{gn1.goods_nomenclature_item_id}")
  end

  def chemical_attributes(commodity)
    {
      "id": chemical.id.to_s,
      "cas": chemical.cas.to_s,
      "name": chemical.name.to_s,
      "goods_nomenclature_map": goods_nomenclature_map(commodity)
    }
  end

  def goods_nomenclature_map(commodity)
    return nil unless commodity

    {
      "#{commodity.id}": commodity.goods_nomenclature_item_id.to_s
    }
  end
end
