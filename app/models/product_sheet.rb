class ProductSheet < ApplicationRecord
  has_many :products

  def to_csv
    attributes = %w{name tags url price}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      self.products.each do |product|
        csv << attributes.map do |attr|
          product.send(attr)
        end
      end
    end
  end
  
end
