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

class StandardItem < Item
  def update_quality
    @quality -= 1 unless @quality == 0
    @quality -= 1 if @sell_in < 0
  end

  def update_sellIn
    @sell_in -= 1
  end
end

class AgedBrie < Item
  def update_quality
    @quality += 1 if @quality < 50
  end

  def update_sellIn
    @sell_in -= 1
  end
end

class BackstagePass < Item
  def update_quality
    if @sell_in < 0
      @quality = 0
    elsif @sell_in < 6
      @quality += 3 unless @quality > 47
    elsif @sell_in < 11
      @quality += 2 unless @quality > 48
    else
      @quality += 1
    end
  end

  def update_sellIn
    @sell_in -= 1
  end
end

class Sulfuras < Item
  def update_quality
    @quality = @quality
  end

  def update_sellIn
    @sell_in = @sell_in
  end
end

class Conjured < Item
  def update_quality
    @quality -= 2 unless @quality == 0
    @quality -= 2 if @sell_in < 0
  end

  def update_sellIn
    @sell_in -= 1
  end
end
