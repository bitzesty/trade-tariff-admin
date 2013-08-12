class PagesController < ApplicationController
  def index
    @sections = Section.all
    @chapters = Chapter.all
  end
end
