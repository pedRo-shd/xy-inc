FactoryBot.define do
  factory :point_of_interest do
    name { FFaker::CompanyIT.prefix }
    x { rand(1..99) }
    y { rand(1..99) }
  end
end
