class Admin::ProductsController < Admin::AdminController
  before_action :check_login?

  def index
    @pagy, @products = pagy Product.all, items: Settings.product.items
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".flash_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t ".flash_danger"
      @categories = Category.all
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(Product::PRODUCT_ATTRIBUTE)
  end
end
