# frozen_string_literal: true

require_relative 'item'

class GildedRose
  
  MIN_QUALITY = 0
  MAX_QUALITY = 50
  BY_ONE = 1
  BY_TWO = 2

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
      when 'Conjured item'
        update_conjured(item)
      else
        update_normal(item)
      end
    end
  end

  private

  def update_normal(item)
    item.quality -= item.sell_in < MIN_QUALITY ? BY_TWO : BY_ONE
    item.quality = item.quality.clamp(MIN_QUALITY, MAX_QUALITY)
    item.sell_in -= BY_ONE 
  end

  def update_conjured(item)
    item.quality -= item.sell_in < MIN_QUALITY ? 4 : BY_TWO
    item.quality = item.quality.clamp(MIN_QUALITY, MAX_QUALITY)
    item.sell_in -= BY_ONE 
  end

  def update_brie(item)
    item.quality += BY_ONE
    item.quality = item.quality.clamp(MIN_QUALITY, MAX_QUALITY)
    item.sell_in -= BY_ONE 
  end

  def update_backstage(item)
    if item.sell_in < 6
      item.quality += 3
    elsif item.sell_in < 11
      item.quality += BY_TWO
    else
      item.quality += BY_ONE
    end
    item.quality = MIN_QUALITY if item.sell_in < MIN_QUALITY
    item.quality = item.quality.clamp(MIN_QUALITY, MAX_QUALITY)
    item.sell_in -= BY_ONE 
  end

end


