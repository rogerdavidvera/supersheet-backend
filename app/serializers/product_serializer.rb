class ProductSerializer < ActiveModel::Serializer
  belongs_to :product_sheet
  attributes :id, :name, :tags, :url, :price, :product_sheet_id

end
