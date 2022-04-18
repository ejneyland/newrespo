require_relative './product'

class Stocklist
    attr_reader :name, :products

    def initialize(name, products)
        @name = name
        @products = products
    end

    def add_product(id, make, model, type, quantity)
        product = Product.new(id, make, model, type, quantity)
        @products << product
    end

    def get_quantity_by_id(id)
        item = @products.find {|product| product.id == id}
        return item.quantity
    end

end

