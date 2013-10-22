module Notes
  module Sections
    class SectionNotesController < ApplicationController
      before_filter :authorize_user

      def new
        @section_note = SectionNote.new
      end

      def create
        @section_note = section.section_note.build(section_note_create_params)

        if @section_note.save
          redirect_to index_url, notice: 'Section note was successfully created.'
        else
          render :new
        end
      end

      def edit
        @section_note = section.section_note.fetch
      end

      def update
        @section_note = section.section_note.fetch
        @section_note.assign_attributes(section_note_update_params)

        if @section_note.valid?
          @section_note.save

          redirect_to index_url, notice: 'Section note was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @section_note = section.section_note.fetch
        @section_note.destroy

        redirect_to index_url, notice: 'Section note was successfully removed.'
      end

      private

      def section
        @section ||= Section.find(params[:section_id])
      end
      helper_method :section

      def authorize_user
        authorize SectionNote, :edit?
      end

      def section_note_create_params
        params.require(:section_note).permit(:content, :section_id)
      end

      def section_note_update_params
        params.require(:section_note).permit(:content).merge(section_id: section.id)
      end
    end
  end
end
