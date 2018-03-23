class Api::V1::PointsOfInterestController < ApplicationController

  def index
    @points_of_interest = PointOfInterest.name_of_localities
    render json: @points_of_interest, status: 200
  end

  def create
    @point_of_interest = PointOfInterest.new(point_of_interest_params)

    if @point_of_interest.save
      render @point_of_interest, status: :created
    else
      render json: @point_of_interest.errors, status: :unprocessable_entity
    end
  end

  def get_by_proximity
    @points_of_interest_by_proximity = PointByProximity.new(point_of_interest_params)
                                                       .call
    render json: @points_of_interest_by_proximity, status: 200
  end


  private

  def point_of_interest_params
    params.permit(:name, :x, :y, :d_max)
  end
end
