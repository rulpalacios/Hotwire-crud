class ProductsController < ApplicationController
  def index
    @products = Product.order(:price)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
