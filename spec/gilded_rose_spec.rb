# frozen_string_literal: true

require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'Quality and Sellin of regular item is decreased by 1' do
      items = [Item.new('foo', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
      expect(items[0].sell_in).to eq 4
    end

    it 'Regular item decreases by two after sell by date' do
      items = [Item.new('foo', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
      expect(items[0].sell_in).to eq(-1)
    end

    it 'Stops at 0 even if it should -2 from the quality' do
      items = [Item.new('foo', 0, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq(-1)
    end

    it 'Item cannot go below 0 quality' do
      items = [Item.new('foo', 10, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq 9
    end

    it 'Aged brie should increase in quality as sell_in decreasing' do
      items = [Item.new('Aged Brie', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 11
      expect(items[0].sell_in).to eq 4
    end

    it 'Item like Aged brie cannot go above the quality of 50' do
      items = [Item.new('Aged Brie', 5, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq 4
    end

    it 'Backstage passes increase in value +2 if 10 days are left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 12
      expect(items[0].sell_in).to eq 9
    end

    it 'Backstage passes increase in value +3 if 5 days are left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 13
      expect(items[0].sell_in).to eq 4
    end

    it 'Backstage passes set to quality of 0 if sell_in is negative' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 45)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq(-2)
    end

    it 'Checks Sulfuras stays the same' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 40)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
      expect(items[0].sell_in).to eq 0
    end
  end
end
