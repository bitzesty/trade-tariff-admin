class GovspeakController < ApplicationController
  def govspeak
    # Keeps either the entire current flash or a specific flash entry
    # available for the next action
    flash.keep

    if params[:govspeak]
      doc = Govspeak::Document.new params[:govspeak]

      respond_to do |format|
        format.json { render json: {govspeak: doc.to_sanitized_html.to_s} }
      end
    else
      render nothing: true, status: :no_content
    end
  end
end


