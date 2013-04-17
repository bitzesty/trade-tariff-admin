class Chapter < Sequel::Model(:goods_nomenclatures)
  set_dataset filter("goods_nomenclatures.goods_nomenclature_item_id LIKE ?", '__00000000').
              order(:goods_nomenclature_item_id.asc)
end
