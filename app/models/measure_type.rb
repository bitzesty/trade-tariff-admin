class MeasureType
  include Her::JsonApi::Model

  collection_path '/admin/measure_types'

  attributes :id, :description, :validity_start_date, :validity_end_date

  def description
    super.presence || ''
  end

  def to_s
    id
  end
end
