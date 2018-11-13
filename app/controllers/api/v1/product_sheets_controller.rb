class Api::V1::ProductSheetsController < ApplicationController
  before_action :find_product_sheet, only: [:update, :show]
  def index
    @product_sheets = ProductSheet.all
    render json: @product_sheets
  end

  def show
    render json: @product_sheet, status: :accepted
  end

  def update
    @product_sheet.update(strong_params)
    if @product_sheet.save
      render json: @product_sheet, status: :accepted
    else
      render json: { errors: @product_sheet.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def strong_params
    params.permit(:name)
  end

  def find_product
    @product_sheet = ProductSheet.find(params[:id])
  end
end
