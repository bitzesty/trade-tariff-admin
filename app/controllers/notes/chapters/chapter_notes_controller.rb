module Notes
  module Chapters
    class ChapterNotesController < ApplicationController
      before_filter :authorize_user

      def new
        @chapter_note = ChapterNote.new
      end

      def create
        @chapter_note = chapter.chapter_note.build(chapter_note_create_params)

        if @chapter_note.save
          redirect_to notes_section_chapters_url(section_id: chapter.section[:id]), notice: 'Chapter note was successfully created.'
        else
          render :new
        end
      end

      def edit
        @chapter_note = chapter.chapter_note.fetch
      end

      def update
        @chapter_note = chapter.chapter_note.fetch
        @chapter_note.assign_attributes(chapter_note_update_params)

        if @chapter_note.valid?
          @chapter_note.save

          redirect_to notes_section_chapters_url(section_id: chapter.section[:id]), notice: 'Chapter note was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @chapter_note = chapter.chapter_note.fetch
        @chapter_note.destroy

        redirect_to notes_section_chapters_url(section_id: chapter.section[:id]), notice: 'Chapter note was successfully removed.'
      end

      private

      def chapter
        @chapter ||= Chapter.find(params[:chapter_id])
      end
      helper_method :chapter

      def authorize_user
        authorize ChapterNote, :edit?
      end

      def chapter_note_create_params
        params.require(:chapter_note).permit(:content, :chapter_id)
      end

      def chapter_note_update_params
        params.require(:chapter_note).permit(:content).merge(chapter_id: chapter.id)
      end
    end
  end
end
