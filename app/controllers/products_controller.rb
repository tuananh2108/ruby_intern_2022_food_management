class ProductsController < ApplicationController
  def index
    @pagy, @products = pagy Product.all, items: Settings.product.items
  end
end
