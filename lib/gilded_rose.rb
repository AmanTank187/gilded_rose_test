# frozen_string_literal: true

require_relative 'item'

class GildedRose
  
  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        update_brie(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage(item)
      when 'Sulfuras, Hand of Ragnaros'
        item.quality = 80
        item.sell_in = 0
      else
        update_normal(item)
      end
    end
  end

  private

  def update_normal(item)
    item.sell_in -= 1
    item.quality -= item.sell_in < MIN_QUALITY ? 2 : 1
    quality_restriction(item)
  end

  def update_brie(item)
    item.sell_in -= 1
    item.quality += 1
    quality_restriction(item)
  end

  def update_backstage(item)
    item.sell_in -= 1
    item.quality += if item.sell_in < 6
                      3
                    elsif item.sell_in < 11
                      2
                    else
                      1
                    end

    item.quality = MIN_QUALITY if item.sell_in < MIN_QUALITY
    quality_restriction(item)
  end

  def quality_restriction(item)
    if item.quality < MIN_QUALITY
      item.quality = MIN_QUALITY
    elsif item.quality > MAX_QUALITY
      item.quality = MAX_QUALITY
    end
  end
end


