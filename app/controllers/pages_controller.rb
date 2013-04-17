class PagesController < ApplicationController
  def index
    @section_notes = SectionNote.eager(:section).all
    @chapter_notes = ChapterNote.all
  end
end
