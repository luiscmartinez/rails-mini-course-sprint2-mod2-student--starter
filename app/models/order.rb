class Order < ApplicationRecord
  def products 
    product_ids = OrderProduct.where(order_id: id).pluck(:product_id)
    Product.find([product_ids])
  end

  def shippable?
    status != 'shipped' && self.products ? true : false
  end

  def ship
    self.shippable? && update(status: "shipped")
  end

end
