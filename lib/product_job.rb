class ProductJob < Struct.new(:product_id)
  def perform
    Product.find(self.product_id).perform
  end
end