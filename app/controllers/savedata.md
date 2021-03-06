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


before_action :find_product_sheet, only: [:update]
def index
  @product_sheets = ProductSheet.all
  render json: @product_sheets
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
