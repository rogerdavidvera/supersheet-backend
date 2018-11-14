class ProductSerializer < ActiveModel::Serializer
  belongs_to :product_sheet
  attributes :name, :tags, :url, :price, :product_sheet_id
end
