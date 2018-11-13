class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:update, :show]
  def index
    @products = Product.all
    render json: @products
  end

  def show
    render json: @product, status: :accepted
  end

  def create
    # byebug
    @product = Product.create(strong_params)
    if @product.save
      render json: @product, status: :accepted
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessible_entity
    end

  end

  def update
    @product.update(strong_params)
    if @product.save
      render json: @product, status: :accepted
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessible_entity
      # format.js { render 'errors', errors: @products.errors }
    end
  end

  private

  def strong_params

    params.require(:product).permit(:name, :tags, :url, :product_sheet_id)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
