class GildedRose

  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      # reduce quality by 1 for standard items and if quality is more than 0
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      # for Aged Brie and Backstage passes
      else
        # for aged brie and backstage pass with more than 10 days to the concert
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            # for backstage passes less than 11 days to go increase quality by additional 1
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            # for backstage passes with less than 6 days to go increase quality by additional 1
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      # reduce sell_in by 1 for all items except Sulfuras
      item.sell_in = item.sell_in - 1 unless item.name == "Sulfuras, Hand of Ragnaros"
      # if passed sell by date
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            # for backstage pass, reduce quality to 0
            item.quality = item.quality - item.quality
          end
        else
          # for aged brie, increase quality by 1
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end

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
