class PagesController < ApplicationController
  def index
    @section_notes = [] # SectionNote.eager(:section).all
    @chapter_notes = [] # uninitialized constant Sass::UtilChapterNote.all
  end
end
