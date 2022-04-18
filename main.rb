require_relative './invent_classes/inventory'
require_relative './invent_classes/stocklist'
require_relative './invent_classes/manulist'
require_relative './invent_classes/invoice'
require_relative './invent_classes/product'
require_relative './invent_methods/methods'
require_relative './spec/inventory_spec'

require 'tty-prompt'
require 'rainbow'

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

stocklist = Stocklist.new(@name, @products)
@manulist = Manulist.new(@name, @manu_items)

welcome

loop do
    
    selection = TTY::Prompt.new.select(Rainbow("What would you like to do?").yellow) do |menu|
        menu.choice("View Stocklist", 1)
        menu.choice("View Manufacturing List", 2)
        menu.choice("Process Invoice", 3)
        menu.choice("Exit App", 4)
    end
    
    case selection
        when 1
            display_stocklist
            exit_cont

        when 2
            display_manulist

        when 3
            process_invoice
        
        when 4
            break
    end
end