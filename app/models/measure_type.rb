class MeasureType
  include Her::Model

  include_root_in_json true

  attributes :id,
             :description,
             :validity_start_date,
             :validity_end_date

  def description
    super.presence || ''
  end

  def to_s
    id
  end
end
