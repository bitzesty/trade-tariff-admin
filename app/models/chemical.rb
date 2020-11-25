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
      unless response.success?
        return parsed_data
      end
    end
    Chemical.find(id)
  end

  def create_map(goods_nomenclature_item_id)
    Chemical.post_raw "/admin/chemicals/#{id}/map/#{goods_nomenclature_item_id}" do |parsed_data, response|
      unless response.status == 201
        return parsed_data
      end
    end
    Chemical.find(id)
  end

  def delete_map(old_id)
    Chemical.delete_raw "/admin/chemicals/#{id}/map/#{old_id}" do |parsed_data, response|
      unless response.status == 200
        return parsed_data
      end
    end
    Chemical.find(id)
  end

  def update_chemical(chemical_id, params)
    Chemical.patch_raw "/admin/chemicals/#{chemical_id}?#{params.to_query}" do |parsed_data, response|
      unless response.status == 202 # Accepted
        return parsed_data
      end
    end
    Chemical.find(id)
  end
end
