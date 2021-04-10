FactoryBot.define do
  factory :subdevvit do
    sequence(:name) { |n| "subdevvit_#{n}" }
    description { 'Lorem ipsum dolor sit amet' }
  end
end
