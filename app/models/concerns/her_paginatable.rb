module HerPaginatable
  #override private method to return a paginated collection
  def new_collection(parsed_data)
    pagination = parsed_data[:data][:pagination]
    collection = Her::Model::Attributes.initialize_collection(self, parsed_data)
    Kaminari.paginate_array(
      collection,
      total_count: pagination[:total_count]
    ).page(pagination[:page]).per(pagination[:per])
  end
end
