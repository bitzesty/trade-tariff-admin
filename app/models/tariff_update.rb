class TariffUpdate
  include Her::Model
  extend HerPaginatable

  attributes :update_type, :state, :created_at, :updated_at, :applied_at, :filesize, :exception_backtrace, :exception_class, :exception_queries, :conformance_errors

  collection_path '/updates'
  parse_root_in_json :update, format: :active_model_serializers

  def state
    case attributes[:state]
    when 'A' then 'Applied'
    when 'M' then 'Missing'
    when 'P' then 'Pending'
    when 'F' then 'Failed'
    end
  end

  def update_type
    case attributes[:update_type]
    when /Taric/ then 'TARIC'
    when /Chief/ then 'CHIEF'
    end
  end

  def missing?
    attributes[:state] == 'M'
  end

  def filename
    super unless missing?
  end

  def file_date
    filename.try :slice, 0, 10
  end

  def created_at
    Time.parse(super)
  end

  def applied_at
    Time.parse(super) if super.present?
  end

  def to_s
    "Applied #{update_type} at #{updated_at} (#{filename})"
  end

  def id
    created_at.to_s.parameterize
  end
end
