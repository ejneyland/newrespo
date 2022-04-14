

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

    # invoices = JSON.load_file("./sample_invoices.json", symbolize_keys: true)

    def update_product_quantity(id, quantity)
        p quantity
        @products = @products.map do |product|
            p product
            if product.id == id
                product.quantity = quantity
            else
                product
            end
        end
    end

    def get_quantity_by_id(id)
        item = @products.find {|product| product.id == id}
        return item.quantity
    end

    def display_stocklist
        break_line
        puts " "*23 + "| " + Rainbow(@name).green + " |"
        break_line
        puts Rainbow("ID").orange + " "*10 + "Make" + " "*6 + "Model" + " "*15 + "Type" + " "*15 + Rainbow("Qty").red
        break_line
    end

end