class ProductsController < ApplicationController
def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find(params["id"])
    render :show
  end

  def create
    @product = Product.create(
      name: params["name"],
      user_id: params["user_id"],
      price: params["price"],
    )

    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def update
    @product = Product.find(params["id"])
    @product.update(
      name: params["name"] || @product.name,
      shop_owner: params["user_id"] || @product.user_id,
      price: params["price"] || @product.price
    )
    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def destroy
    @product = Product.find(params["id"])
    @product.destroy

    render json: { message: "Product deleted" }
  end
end
