class Chapter
  include Her::Model

  def short_code
    goods_nomenclature_item_id.first(2).to_i
  end

  def to_param
    goods_nomenclature_item_id
  end

  def to_s
    goods_nomenclature_item_id
  end
end
