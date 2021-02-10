class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie"
        update_brie(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_backstage(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
      else 
        update_normal(item)
      end 
    end 
  end 

  private 

  def update_normal(item)
    item.sell_in -= 1
    item.sell_in < 0 ? item.quality -=2 : item.quality -=1
    item.quality = 0 if item.quality < 0
          
  end 

  def update_brie(item)
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50 
  end 

  def update_backstage(item)
    item.sell_in -= 1
     if item.sell_in < 6
        item.quality += 3
     elsif item.sell_in < 11
        item.quality += 2
     else 
        item.quality += 1
     end 
          
    item.quality = 0 if item.sell_in < 0
          
    item.quality = 50 if item.quality > 50
      
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
