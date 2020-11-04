class ChemicalsController < ApplicationController
  respond_to :json

  def index
    @chemicals = Chemical.all
  end

  def new_map
    @chemical = Chemical.find(params[:chemical_id])
  end

  def create_map
    @chemical = Chemical.find(params[:chemical_id])
    result = @chemical.create_map(chemical_params[:new_id])

    if result && result[:errors].blank?
      redirect_to chemical_edit_commodity_mapping_path(@chemical), notice: "Mapping for #{chemical_params[:new_id]} was created"
    else
      flash.alert = result[:errors].map { |e| e[:title] }.join('<br/>').to_s.html_safe
      render :new_map
    end
  end

  def edit_map
    @chemical = Chemical.find(params[:chemical_id])
  end

  def update_map
    @chemical ||= Chemical.find(params[:chemical_id])
    result = @chemical.update_map(params[:gn_id], chemical_params[:new_id])

    if result && result[:errors].blank?
      redirect_to edit_chemical_path(@chemical), notice: "Mapping for #{chemical_params[:new_id]} was updated"
    else
      flash.alert = result[:errors].map { |e| e[:title] }.join('<br/>').to_s.html_safe
      render :edit
    end
  end

  private

  def chemical_params
    params.require(:chemical).permit(:new_id)
  end

  def chemical
    @chemical ||= Chemical.find(params[:id])
  end
  helper_method :chemical
end
