require_relative './invent_classes/inventory'
require_relative './invent_classes/stocklist'
# require_relative './invent_classes/manulist'
# require_relative './invent_classes/invoice'
require_relative './invent_classes/product'
require_relative './invent_methods/methods'
require_relative './spec/inventory_spec'

require 'tty-prompt'

@products.each do |product|
    product = Product.new(id, make, model, type, quantity)
end

welcome
# puts @products
display_stocklist

loop do
    
    selection = TTY::Prompt.new.select(Rainbow("What would you like to do?").yellow) do |menu|
        menu.choice("View Stocklist", 1)
        menu.choice("View Manufacturing List", 2)
        menu.choice("Process Invoice", 3)
        menu.choice("Exit App", 4)
    end
    
    case selection
        when 1
            view_stocklist
            exit_cont

        when 2
            view_manuf_list
            exit_cont

        when 3
            process_invoice
        
        when 4
            break
    end
end