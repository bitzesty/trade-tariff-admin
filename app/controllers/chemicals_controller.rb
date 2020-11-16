class ChemicalsController < ApplicationController
  respond_to :json

  def index
    @chemicals = Chemical.all
    @chemical = Chemical.new
  end

  def create
    @chemical = Chemical.create(chemical_params)

    if @chemical && @chemical[:errors].blank?
      redirect_to chemical_edit_commodity_mapping_path(@chemical), notice: "Chemical #{chemical_params[:new_id]} was created"
    else
      flash.alert = result[:errors].map { |e| e[:title] }.join('<br/>').to_s.html_safe
      render :new_map
    end
  end
  
  def update
    update_params = { }
    # chemical.update_attributes(
    #   cas: chemical_params[:cas]
    # ) 
    if chemical_params[:cas]
      update_params[:cas] = chemical_params[:cas]
    end

    if chemical_params[:chemical_name_id] && chemical_params[:name]
      update_params[:chemical_name_id] = chemical_params[:chemical_name_id]
      update_params[:new_chemical_name] = chemical_params[:name]
    end

    result = chemical.update_chemical(chemical.id, update_params)

    if result && result[:errors].blank?
      redirect_to chemical_edit_commodity_mapping_path(chemical), notice: "Chemical #{chemical.cas} was updated"
    else
      flash.alert = result[:errors].map { |e| e[:title] }.join('<br/>').to_s.html_safe
      render :edit_map
    end
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
      redirect_to chemical_edit_commodity_mapping_path(@chemical), notice: "Mapping for #{chemical_params[:new_id]} was updated"
    else
      flash.alert = result[:errors].map { |e| e[:title] }.join('<br/>').to_s.html_safe
      render :edit_map
    end
  end

  def delete_map
    @chemical ||= Chemical.find(params[:chemical_id])
    result = @chemical.delete_map(params[:gn_id])

    if result && result[:errors].blank?
      redirect_to chemical_edit_commodity_mapping_path(@chemical), notice: "Mapping for #{params[:gn_id]} was deleted"
    else
      flash.alert = result[:errors].map { |e| e[:title] }.join('<br/>').to_s.html_safe
      render :edit_map
    end
  end

  private

  def chemical_params
    params.require(:chemical).permit(:new_id, :cas, :name, :chemical_name_id)
  end

  def chemical
    @chemical ||= Chemical.find(params[:id])
  end
  helper_method :chemical
end
