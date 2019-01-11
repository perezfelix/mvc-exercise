# frozen_string_literal: true

1.upto(10) do |i|
  Item.create!(
    original_price: Faker::Number.decimal(2),
    name: Faker::Food.fruits
  )
  p "ITEM #{i} : créé"
end
