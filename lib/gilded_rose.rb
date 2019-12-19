class GildedRose

  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"

      case item.name
      when "Aged Brie"
        increase_quality_if_below_MAX(item)

      when "Backstage passes to a TAFKAL80ETC concert"
        backstage_pass(item)

      when "Conjured Mana Cake"
        item.quality -= 2 unless item.quality == 0
        item.quality -= 2 if item.sell_in < 0

      else
        item.quality -= 1 unless item.quality == 0
        item.quality -= 1 if item.sell_in < 0
      end

      item.sell_in -= 1
    end
  end

  def increase_quality_if_below_MAX(item)
    if item.quality < MAX_QUALITY
      item.quality += 1
    end
  end

  def backstage_pass(item)
    increase_quality_if_below_MAX(item)
    if item.sell_in < 11
      increase_quality_if_below_MAX(item)
    end
    if item.sell_in < 6
      increase_quality_if_below_MAX(item)
    end
    if item.sell_in < 0
      item.quality = MIN_QUALITY
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
