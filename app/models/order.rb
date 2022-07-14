class Order < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :order_items, dependent: :destroy
end
