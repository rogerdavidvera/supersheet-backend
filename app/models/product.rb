require "google/cloud/vision"

class Product < ApplicationRecord
  belongs_to :product_sheet

  # Instance method that is called on a product.
  # A product is always created with a URL property.
  # This method will use Google Cloud Vision API
  # to anaylze the image retrieved from it's image url.
  # And then update it's name and tag properties from 'nil'
  # to the values retrieved after image analysis.

  def finish_product
    vision = Google::Cloud::Vision.new({
      project: "mod3-final-project",
      keyfile: "keyfile.json" # You're keyfile here, (ours in in root)
    })

    image = vision.image(self.url)

    name = getTextFromImage(image)
    tags = getTagsFromImage(image)
    # The image will update itself and return whether true if all
    # has worked out.
    self.update(name: name, tags: tags)
  end
end

private

def getTextFromImage(image)
  # An image has a text property.
  # That text property has a text propety.
  # image.text.text gives you the text that the Google Vision API can read from an image.
  # It can be rendered weird.
  # For example, "Hello\nthere!"
  # We want, "Hello there!", so we split, then join.
  image.text.text.split("\n").join(' ')
end

def getTagsFromImage(image)
  array_of_labels = []
  # An image has labels
  # Each label has description.
  # A description is like what things, or objects
  # the Google Vision API can recognize from an image.

  image.labels.each do |label|
    array_of_labels << label.description
  end

  # We don't want to return
  # ["text", "yellow", "font", "product", "brand", "graphics", "logo"]
  # We want "text, yellow, font, product, brand, graphics, logo"
  array_of_labels.join(', ')

end
