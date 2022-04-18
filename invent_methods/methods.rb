require 'rainbow'
require 'tty-prompt'

def welcome
    @name = "Retro Spares Stock Inventory System"
    puts Rainbow("Welcome to the #{@name}!").red
end

def display_stocklist
    break_line
    puts Rainbow("ID").orange + " "*10 + "Make" + " "*6 + "Model" + " "*15 + "Type" + " "*15 + Rainbow("Qty").red
    break_line
    @products = @products.each do |product|
        puts "#{product[:id]}" + " "*(12 - product[:id].length) + "#{product[:make]}" + " "*(10 - product[:make].length) + "#{product[:model]}" + " "*(20 - product[:model].length) + "#{product[:type]}" + " "*(20 - product[:type].length) + "#{product[:quantity]}"
    end
    break_line
end

def process_invoice
end

def exit_cont
    exit_cont = TTY::Prompt.new.select("Continue/Exit?") do |menu|
        menu.choice("View a product", 1)
        menu.choice("Exit", 2)
    end
    case exit_cont
    when 1
        puts "Select a product"
        choose_product
    when 2
        puts "okay"
    end
end

def product_type

    @products.each do |product|
        if product[:type] == "Speedo Cable"
            puts product[:id]
        else
        end
    end
end

# def select_product
#     prompt = TTY::Prompt.new.select("Choose your product") do |menu|
#         menu.per_page 4
#         menu.choice("1")
#         menu.choice("2")
#         menu.choice("3")
#         menu.choice("4")
#     end
# end

def yes_no
    yes_no = TTY::Prompt.new.select(Rainbow("Would you like to add this product to the manufacturing list?").green) do |menu|
        menu.choice("Yes", 1)
        menu.choice("No", 2)
    end
end

def choose_product
    puts Rainbow("Enter in a product ID for more options. E.g. ACVSV6").green
    response = gets.chomp.upcase
    clear
    if @products.find { |product| product[:id] == response }
        puts Rainbow(@products.find { |product| product[:id] == response }[:id]).yellow
        puts "Quantity: " + "#{@products.find { |product| product[:id] == response }[:quantity]}"
    end
        yes_no
            case
            when 1
                puts Rainbow("How many?").green
                amount = gets.chomp.to_i
                clear
                chosen_product = @products.find { |product| product[:id] == response }
                @manulist.add_manu_item(chosen_product[:id], amount)

                puts Rainbow("Confirmed. You just added #{amount} of #{response} to the manufacturing list.").green
                puts "(hit enter to continue)"
                continue = gets
                break_line
            when 2
                puts "Okay"
            end
end

def break_line
    puts "-----------------------------------------------------------------"
end

def smaller_line
    puts "------------------------------"
end

def clear
    puts "\e[2J\e[f"
end

