require 'rails_helper'

RSpec.describe PointOfInterest, type: :model do

  it "is not valid without a name, must have a specific message error" do
    poi = PointOfInterest.new(name: nil, x: 10, y: 50)

    expect(poi).to_not be_valid
    expect(poi.errors[:name]).to include("can't be blank")
  end

  it "is not valid without a x" do
    poi = PointOfInterest.new(name: 'Restaurant', x: nil, y: 50)
    expect(poi).to_not be_valid
  end

  it "is not valid without a y" do
    poi = PointOfInterest.new(name: 'Bakery', x: 10, y: nil)
    expect(poi).to_not be_valid
  end

  it "is valid with valid attributes" do
    poi = PointOfInterest.new(name: 'Bookstore', x: 10, y: 50)
    expect(poi).to be_valid
  end

  it "is not valid with attribute 'x' negative, must have a specific message error" do
    poi = PointOfInterest.new(name: 'Drugstore', x: -10, y: 20)

    expect(poi).to_not be_valid
    expect(poi.errors[:base]).to include("Coordinates can't be negative")
  end

  it "is not valid with attribute 'y' negative, must have a specific message error" do
    poi = PointOfInterest.new(name: 'Pub', x: 10, y: -50)

    expect(poi).to_not be_valid
    expect(poi.errors[:base]).to include("Coordinates can't be negative")
  end

  it "is not valid with attribute 'y' and 'x' negative, must have a specific message error" do
    poi = PointOfInterest.new(name: 'Pub', x: -10, y: -50)

    expect(poi).to_not be_valid
    expect(poi.errors[:base]).to include("Coordinates can't be negative")
  end

end
