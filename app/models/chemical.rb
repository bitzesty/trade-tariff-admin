class Chemical
  include Her::JsonApi::Model
  extend HerPaginatable

  resource_path "/admin/chemicals/:id/map"
  collection_path '/admin/chemicals'

  attributes :cas,
             :name,
             :goods_nomenclature_map

  has_many :chemical_names

  attr_accessor :goods_nomenclature_item_id
  attr_accessor :gn_id
  attr_accessor :chemical_name_id
  attr_accessor :new_name

  def update_map(old_id, goods_nomenclature_item_id)
    Chemical.patch_raw "/admin/chemicals/#{id}/map/#{old_id}?goods_nomenclature_item_id=#{goods_nomenclature_item_id}" do |parsed_data, response|
      handle_response(parsed_data, response, reference_object: goods_nomenclature_item_id)
    end
  end

  def create_map(goods_nomenclature_item_id)
    Chemical.post_raw "/admin/chemicals/#{id}/map/#{goods_nomenclature_item_id}" do |parsed_data, response|
      handle_response(parsed_data, response, reference_object: goods_nomenclature_item_id, expected: 201)
    end
  end

  def delete_map(old_id)
    Chemical.delete_raw "/admin/chemicals/#{id}/map/#{old_id}" do |parsed_data, response|
      handle_response(parsed_data, response, reference_object: old_id)
    end
  end

  def update_chemical(chemical_id, params)
    Chemical.patch_raw "/admin/chemicals/#{chemical_id}?#{params.to_query}" do |parsed_data, response|
      handle_response(parsed_data, response, reference_object: chemical_id)
    end
  end

  private

  def handle_response(parsed_data, response, reference_object: 'Reference object', expected: 200)
    Rails.logger.warn response.status
    if response.status == expected.to_i
      parsed_data
    else
      ActiveSupport::HashWithIndifferentAccess.new(
        {
          errors: [
            {
              title: "#{reference_object} - #{Rack::Utils::HTTP_STATUS_CODES[response.status]}"
            }
          ]
        }
      )
    end
  end
end
