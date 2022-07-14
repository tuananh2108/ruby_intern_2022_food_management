class Category < ApplicationRecord
  acts_as_paranoid

  has_many :products, dependent: :destroy

  validates :name, presence: true,
            length: {maximum: Settings.category.max_length}
end
