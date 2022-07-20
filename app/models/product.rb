class Product < ApplicationRecord
  acts_as_paranoid

  belongs_to :category
  has_many :order_items, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true,
            length: {maximum: Settings.product.name.max_length}

  validates :description,
            length: {maximum: Settings.product.description.max_length}

  validates :image,
            content_type: {in: Settings.product.image.image_path,
                           message: :wrong_format},
            size: {less_than: Settings.product.image.less_than.megabytes,
                   message: :too_big}
end
