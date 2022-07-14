class Product < ApplicationRecord
  acts_as_paranoid

  belongs_to :category
  has_many :order_items, dependent: :destroy

  validates :name, presence: true,
            length: {maximum: Settings.product.name.max_length}

  validates :description,
            length: {max_length: Settings.product.description.max_length}

  validates :image,
            presence: true,
            content_type: {in: Settings.product.image_path,
                           message: :wrong_format},
            size: {less_than: Settings.product.less_than.megabytes,
                   message: :too_big}
end
