class Api::V1::PointsOfInterestController < ApplicationController

  def index
    @points_of_interest = PointOfInterest.all
  end

  def create
    @point_of_interest = PointOfInterest.new(point_of_interest_params)

    if @point_of_interest.save
      render @point_of_interest, status: :created
    else
      render json: @point_of_interest.errors, status: :unprocessable_entity
    end
  end


  private

  def point_of_interest_params
    params.require(:point_of_interest).permit(:name, :x, :y)
  end
end
