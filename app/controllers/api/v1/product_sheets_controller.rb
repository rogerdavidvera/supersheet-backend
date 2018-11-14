class Api::V1::ProductSheetsController < ApplicationController
  include ActionController::MimeResponds

  before_action :find_product_sheet, only: [:update, :show, :download]

  def index
    @product_sheets = ProductSheet.all
    render json: @product_sheets
  end

  def download
    send_data @product_sheet.to_csv, filename: "#{@product_sheet.name}.csv"
  end

  def create

    @product_sheet = ProductSheet.create(strong_params)

    if @product_sheet.save
      @product_sheet.finish_product
      render json: @product_sheet, status: :accepted
    else
      render json: { errors: @product_sheet.errors.full_messages }, status: :unprocessible_entity
    end

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

  def find_product_sheet
    @product_sheet = ProductSheet.find(params[:id])
  end
end
