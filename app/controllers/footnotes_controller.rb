class FootnotesController < ApplicationController
  respond_to :json

  def show
  end

  def index
    @footnotes = Footnote.all
  end

  def edit
  end

  def update
    @footnote = Footnote.find(params[:id])
    @footnote.assign_attributes(footnote_params)

    if @footnote.valid?
      @footnote.save

      redirect_to footnotes_url, notice: "Footnote #{@footnote} was successfully updated"
    else
      render :edit
    end
  end

  def show
  end

  private

  def footnote
    @footnote ||= Footnote.find(params[:id])
  end
  helper_method :footnote

  def footnote_params
    params.require(:footnote).permit(:description)
  end
end
