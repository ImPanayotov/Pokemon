FactoryBot.define do
  factory :pokemon do
    sequence :poke_id do |n|
      n
    end
    sequence :name do |n|
      "pikachu #{n}"
    end
  end
end
