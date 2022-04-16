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


def view_manuf_list
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
        select_product
    when 2
        puts "okay"
    end
end

def select_product
    @products.each do |product|
        list = product[:id].each
        prompt = TTY::Prompt.new.select("Choose your letter?", list, per_page: 4)
    end
#   selection = TTY::Prompt.new.select(Rainbow("Select a product").yellow) do |menu|
#         menu.choice("ACVSV6", 1)
#         menu.choice("ACVNV8", 2)
#         menu.choice("XB9C799A", 3)
#         menu.choice("XD9C799A", 4)
#     end  
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

