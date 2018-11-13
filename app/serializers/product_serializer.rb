class ProductSerializer < ActiveModel::Serializer
  belongs_to :product_sheet
  attributes :name, :tags, :url, :product_sheet_id
end
