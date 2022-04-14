require 'rainbow'
require 'tty-prompt'

def welcome
    @name = "Retro Spares Stock Inventory System"
    puts Rainbow("Welcome to the #{@name}!").red
end

def view_stocklist
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
        puts "here is a product"
        user = gets.chomp
    when 2
        puts "okay"
    end
end

def display_stocklist
    @products.each do |product|
        puts product(id, make, model, type, quantity)
    end 
end