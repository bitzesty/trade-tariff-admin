class ChapterNote < Sequel::Model
  set_dataset order(:chapter_id.asc)

  many_to_one :chapter, dataset: -> {
    Chapter.filter("goods_nomenclatures.goods_nomenclature_item_id LIKE ?",
                   chapter_id_fk)
  }

  def chapter_id_fk
    "#{chapter_id.to_s.rjust(2, "0")}00000000"
  end
end
