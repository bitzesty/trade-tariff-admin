class GovspeakController < ActionController::Base
  def preview
    if params[:govspeak]
      doc = Govspeak::Document.new params[:govspeak]

      respond_to do |format|
        format.json { render json: {govspeak: doc.to_html.to_s} }
      end
    else
      render nothing: true, status: :no_content
    end
  end
end


