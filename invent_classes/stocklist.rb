@products = [
{id: "ACVSV6", make: "Holden", model: "Commodore VS V6", type: "Accelerator Cable", quantity: 1},
{id: "ACVNV8", make: "Holden", model: "Commodore VN V8", type: "Accelerator Cable", quantity: 5},
{id: "XB9C799A", make: "Ford", model: "Falcon EL V6", type: "Accelerator Cable", quantity: 0},
{id: "XD9C799A", make: "Ford", model: "Falcon XD V6", type: "Accelerator Cable", quantity: 1},
{id: "92024845", make: "Holden", model: "Commodore VL", type: "Handbrake Cable", quantity: 0},
{id: "92027120", make: "Holden", model: "Commodore VN", type: "Handbrake Cable", quantity: 1},
{id: "XD2A604B", make: "Ford", model: "Falcon XD", type: "Handbrake Cable", quantity: 0},
{id: "XA2853BA", make: "Ford", model: "Falcon XB", type: "Handbrake Cable", quantity: 1},
{id: "9947987", make: "Holden", model: "Commodore VB/VK", type: "Speedo Cable", quantity: 0},
{id: "2806048", make: "Holden", model: "Commodore HK/HG", type: "Speedo Cable", quantity: 1},
{id: "XW17260D", make: "Ford", model: "Falcon XW/XY V8", type: "Speedo Cable", quantity: 0},
{id: "XA17260CB", make: "Ford", model: "Falcon XA/XC V8", type: "Speedo Cable", quantity: 1}
]

# Product << @products
# Stocklist << Product

class Stocklist
    attr_reader :name, :products

    def initialize(name, products)
        @name = name
        @products = products
        @product = product
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

end

