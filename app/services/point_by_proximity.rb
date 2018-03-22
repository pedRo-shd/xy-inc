class PointByProximity

  def initialize(params)
    @x_coordinate = params[:x]
    @y_coordinate = params[:y]
    @d_max        = params[:d_max]
  end

  def call
    calculating_limit_coordinate
  end

  private

  def calculating_limit_coordinate
    @limit_coordinate_x = @x_coordinate + @d_max
    @limit_coordinate_y = @y_coordinate + @d_max
    points_of_interest_with_maximum_limit
  end

  def points_of_interest_with_maximum_limit
    PointOfInterest.where(x: @x_coordinate..@limit_coordinate_x,
                          y: @y_coordinate..@limit_coordinate_y)
  end
end
