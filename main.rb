require_relative './invent_classes/inventory'
# require_relative './invent_classes/stocklist'
# require_relative './invent_classes/manulist'
# require_relative './invent_classes/invoice'
# require_relative './invent_classes/product'
require_relative './invent_methods/methods'
require_relative './spec/inventory_spec'

require 'tty-prompt'

# Welcome to Retro Spares
# What would you like to do?
# Options x 3

welcome
menu_options