class ManuItem
    attr_reader :id
    attr_accessor :quantity

    def initialize
        @id = id
        quantity = quantity
    end

    def add_manu_item
        manu_item = ManuItem.new(id, quantity)
        @manu_items << manu_item
    end
        
end