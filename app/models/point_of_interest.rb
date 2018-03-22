class PointOfInterest < ApplicationRecord

  validates_presence_of :name, :x, :y
  validate :coordinates_negative

  def coordinates_negative
    return unless x.present?
    return unless y.present?
    coordinates_is_negative?
  end

  private

  def coordinates_is_negative?
    if x < 0 || y < 0
      errors.add(:base, "Coordinates can't be negative")
    end
  end
end
