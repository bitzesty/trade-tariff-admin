class Chapter < Sequel::Model(:goods_nomenclatures)
  set_dataset filter("goods_nomenclatures.goods_nomenclature_item_id LIKE ?", '__00000000').
              order(:goods_nomenclature_item_id.asc)

  dataset_module do
    def without_notes
      where{ ~{goods_nomenclature_item_id: ChapterNote.select(:chapter_id).map(&:chapter_id_fk)} }
    end
  end

  def short_code
    goods_nomenclature_item_id.first(2).to_i
  end

  def to_s
    goods_nomenclature_item_id
  end
end
