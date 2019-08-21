class OrderProcessor
  def initialize(order)
    @order = order
    @products = @order.products
  end

  def ship
    self.ship 
  end

  private

  def ship
    return false unless product_available?
    @products.each { |product| product.reduce_inventory }
    @order.ship
  end

  private

  def products_available?
    @products.all? { |product| product.available? }
  end
end