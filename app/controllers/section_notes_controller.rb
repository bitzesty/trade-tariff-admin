class SectionNotesController < ApplicationController
  def new
    @section_note = SectionNote.new
    @sections = Section.without_notes.all
  end

  def create
    @section_note = SectionNote.new(section_note_create_params)

    if @section_note.save
      redirect_to index_path, notice: 'Section note was successfully created.'
    else
      @sections = Section.without_notes.all

      render :new
    end
  end

  def edit
    @section_note = SectionNote.with_pk(params[:id])
  end

  def update
    @section_note = SectionNote.with_pk(params[:id])
    @section_note.set(section_note_update_params)

    if @section_note.save
      redirect_to index_path, notice: 'Section note was successfully updated.'
    else
      render :edit
    end
  end

  private

  def section_note_create_params
    params.require(:section_note).permit(:content, :section_id)
  end

  def section_note_update_params
    params.require(:section_note).permit(:content)
  end
end
