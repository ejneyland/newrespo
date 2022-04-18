# classes, methods and spec files required
require_relative './invent_classes/stocklist'
require_relative './invent_classes/manulist'
require_relative './invent_classes/manuitem'
require_relative './invent_classes/product'
require_relative './invent_methods/methods'
require_relative './spec/inventory_spec'

# Gems required and bundled in a gemfile
require 'tty-prompt'
require 'rainbow'
require 'rspec'
require 'json'


# //////////////////////////////////////////////////
# 
#       Retro Spares Stock Inventory System
#               Terminal Application
#                  Ethan Neyland
# 
# //////////////////////////////////////////////////


# ALL products and their attribute details
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

# Stocklist and Manufacturing list created
stocklist = Stocklist.new(@name, @products)
manulist = Manulist.new(@manu_items = {})
json = manulist.to_json

# App welcome message
welcome

# App main control loop begins
loop do
    
    # App menu-option bar 
    selection = TTY::Prompt.new.select(Rainbow("What would you like to do?").yellow) do |menu|
        menu.choice("View Stocklist", 1)
        menu.choice("View Manufacturing List", 2)
        menu.choice("Process Invoice", 3)
        menu.choice("Exit App", 4)
    end
    
    case selection
        when 1
            # Displays all products, their attributes and stock quantity in a stocklist
            display_stocklist
            # Option to select a product by ID, and add to a manufacturing list with a specified quantity
            exit_cont

        when 2
            # Manulist displays a list of products by ID and qty, needing to be manufactured
            manulist.display_manulist

        when 3
            puts "Invoice Processing"
            # User is prompted with the option to upload an invoice or view stored invoices
            selection = TTY::Prompt.new.select(Rainbow("What would you like to do?").yellow) do |menu|
                menu.choice("Upload invoice", 1)
                menu.choice("View saved invoice", 2)
                menu.choice("Exit", 3)
            end
            case
            when 3
                # Exits the invoice processing function
                break
            end
        when 4
            # Exits the app
            break
    end
end