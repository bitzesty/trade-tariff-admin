class MeasureTypesController < ApplicationController
  respond_to :json

  def show
  end

  def index
    @measure_types = MeasureType.all
  end

  def edit
  end

  def update
    @measure_type = MeasureType.find(params[:id])
    @measure_type.assign_attributes(measure_type_params)

    if @measure_type.valid?
      @measure_type.save

      redirect_to measure_types_url, notice: "Measure Type #{@measure_type} was successfully updated"
    else
      render :edit
    end
  end

  def show
  end

  private

  def measure_type
    @measure_type ||= MeasureType.find(params[:id])
  end
  helper_method :measure_type

  def measure_type_params
    params.require(:measure_type).permit(:description)
  end
end
