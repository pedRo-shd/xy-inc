class PointByProximity

  def initialize(params)
    @x_coordinate = params[:x].to_i
    @y_coordinate = params[:y].to_i
    @d_max        = params[:d_max].to_i
  end

  def call
    calculating_limit_coordinate
  end

  private

  def calculating_limit_coordinate
    points_of_interest_with_maximum_limit
  end

  def points_of_interest_with_maximum_limit
    PointOfInterest.where("circle '((:x, :y), :radius)' @> point (x, y)", x: @x_coordinate, y: @y_coordinate, radius: @d_max)
                   .pluck(:name)
  end
end
