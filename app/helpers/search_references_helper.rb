module SearchReferencesHelper
  def section_select_options
    Section.all.map { |section|
      ["#{section.chapter_from}-#{section.chapter_to}: #{section.title}", section.id]
    }
  end
end
