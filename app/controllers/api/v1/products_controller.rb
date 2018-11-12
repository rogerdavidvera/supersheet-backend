class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:update]
  def index
    @products = Product.all
    render json: @products
  end

  def update
    @product.update(strong_params)
    if @product.save
      render json: @product, status: :accepted
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def strong_params
    params.permit(:id)
  end

  def find_product
    @product = Product.find(params[:name, :tags, :url, :product_sheet_id])
  end
end
