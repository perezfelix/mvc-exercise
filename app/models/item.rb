# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Item < ApplicationRecord
  def price
    if has_discount == true
      price_with_discount = original_price * (1 - discount_percentage.to_f / 100)
      price_with_discount.round(2)
    elsif has_discount == false
      original_price
    end
  end

  def self.average_price
    average_price = Item.all.map(&:price).sum / Item.count
    average_price.round(2)
  end
end
