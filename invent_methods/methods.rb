require 'rainbow'
require 'tty-prompt'

def welcome
    @name = "Retro Spares Stock Inventory System"
    puts Rainbow("Welcome to the #{@name}!").red
end

def menu_options
    prompt = TTY::Prompt.new
    prompt.select("What would you like to do?") do |menu|
        menu.choice "View Stocklist"
        menu.choice "View Manufacturing List"
        menu.choice "Process Invoice"
    end
end