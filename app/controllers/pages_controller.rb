class PagesController < ApplicationController
  def index
    @sections = Section.all
  end
end
