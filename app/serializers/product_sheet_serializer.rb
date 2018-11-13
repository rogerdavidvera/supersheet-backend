class ProductSheetSerializer < ActiveModel::Serializer
  has_many :products
  attributes :name
end
