class ChapterNotesController < ApplicationController
  def new
    @chapter_note = ChapterNote.new
    @chapters = Chapter.without_notes.all
  end

  def create
    @chapter_note = ChapterNote.new(chapter_note_create_params)

    if @chapter_note.save
      redirect_to index_path, notice: 'Chapter note was successfully created.'
    else
      @chapters = Chapter.without_notes.all

      render :new
    end
  end

  def edit
    @chapter_note = ChapterNote.with_pk(params[:id])
  end

  def update
    @chapter_note = ChapterNote.with_pk(params[:id])
    @chapter_note.set(chapter_note_update_params)

    if @chapter_note.save
      redirect_to index_path, notice: 'Chapter note was successfully updated.'
    else
      render :edit
    end
  end

  private

  def chapter_note_create_params
    params.require(:chapter_note).permit(:content, :chapter_id)
  end

  def chapter_note_update_params
    params.require(:chapter_note).permit(:content)
  end
end
