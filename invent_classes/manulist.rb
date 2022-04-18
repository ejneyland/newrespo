require_relative './manuitem'

class Manulist
    attr_reader :manu_items

    def initialize(manu_items)
        @manu_items = manu_items
        manulist = {}
    end

    def get_manu_items
        @manu_items
    end

    # def add_manu_item(id, quantity)
    #     manu_item = ManuItem.new(id, quantity)
    #     @manu_items << manu_item
    # end

    def upsert_manu_item(id, quantity)
        @manu_items[id] = @manu_items[id] ? @manu_items[id] + quantity : quantity
    end

    def display_manulist
        smaller_line
        puts " "*6 + Rainbow("MANUFACTURING LIST").yellow
        smaller_line
        puts " "*6 + Rainbow("ID").orange + " "*12 + Rainbow("Qty").red
        smaller_line
        @manu_items
        smaller_line
    end
end