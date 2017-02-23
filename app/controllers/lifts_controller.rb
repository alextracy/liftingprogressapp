class LiftsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @lift = Lift.new(lift_params)

    if @lift.save
      render json: @lift
    else
      render json: @lift.errors, status: :unprocessable_entity
    end
  end

  def index
    @lifts = Lift.all
  end

  private
  def lift_params
    params.require(:lift).permit(:date, :liftName, :isMetric, :weightLifted, :repsPerformed, :oneRm)
  end

end
