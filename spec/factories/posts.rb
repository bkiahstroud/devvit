FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    text { 'Lorem ipsum dolor sit amet' }

    subdevvit { build(:subdevvit) }
  end
end
