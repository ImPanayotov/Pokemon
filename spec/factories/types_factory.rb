FactoryBot.define do
  factory :type do
    sequence :name do |n|
      "fire #{n}"
    end
  end
end
