class Chemical
  include Her::JsonApi::Model

  resource_path "/admin/chemicals/:id/map"
  collection_path '/admin/chemicals'

  attributes :cas,
             :name,
             :goods_nomenclature_map

  attr_accessor :new_id
  attr_accessor :gn_id

  def update_map(old_id, new_id)
    Chemical.patch_raw "/admin/chemicals/#{id}/map/#{old_id}?new_id=#{new_id}" do |parsed_data, response|
      unless response.success?
        return parsed_data
      end
    end
    Chemical.find(id)
  end

  def create_map(new_id)
    Chemical.post_raw "/admin/chemicals/#{id}/map/#{new_id}" do |parsed_data, response|
      unless response.status == 201
        return parsed_data
      end
    end
    Chemical.find(id)
  end
end