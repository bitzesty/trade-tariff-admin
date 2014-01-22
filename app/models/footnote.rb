class Footnote
  include Her::Model

  include_root_in_json true

  attributes :footnote_id,
             :footnote_type_id,
             :description,
             :validity_start_date,
             :validity_end_date

  def id
    to_param
  end

  def description
    super.presence || ''
  end

  def to_param
    "#{footnote_type_id}#{footnote_id}"
  end

  def to_s
    id
  end
end
