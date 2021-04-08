class GildedRose

  def initialize(items)
    @items = items
  end
  
  def update_quality()


    @items.each do |item|

      def increase_quality(item, amount) 
        item.quality = item.quality + amount
        item.sell_in = item.sell_in - 1

      end

      def decrease_quality(item, amount) 
        if item.sell_in < 0
          amount = amount * 2
          if item.quality > 0
            item.quality = item.quality - amount
          end
        else 
          item.quality = item.quality - amount
        end
        item.sell_in = item.sell_in - 1

        if item.quality < 0
          item.quality = 0
        end

      end

      if item.name == "Aged Brie"
        increase_quality(item, 1)
      
      elsif item.name == "Elixir of the Mongoose"
        decrease_quality(item, 1)

      elsif item.name == "Sulfuras, Hand of Ragnaros"
        decrease_quality(item, 0)
        item.sell_in = nil
      
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        
        if item.sell_in <= 5
          increase_quality(item, 3)
        elsif item.sell_in <= 10
          increase_quality(item, 2)
        else 
          increase_quality(item, 1)
        end
      
      else
        decrease_quality(item, 1)

      end
      



      # if item.name == "Aged Brie"
      #   increase_quality(item, 1)
      # end


    end #<-- extra ends
  end
end
=begin

      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end

  end

end
=end
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
