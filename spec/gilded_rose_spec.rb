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

    it 'Regular item decreases by two after sell in date is less than 0' do
      items = [Item.new('foo', -1, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
      expect(items[0].sell_in).to eq(-2)
    end

    it 'Quality should stop at 0 even if it should decrease by -2' do
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

    it 'Aged brie should increase in quality as sell_in decreases' do
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

    it 'Backstage passes increase in value +2 if 9 - 6 days are left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 6),Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 8)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
      expect(items[0].sell_in).to eq 5
      expect(items[1].quality).to eq 10
      expect(items[1].sell_in).to eq 8
    end

    it 'Backstage passes increase in value +3 if 5 days are left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 13
      expect(items[0].sell_in).to eq 4
    end

    it 'Backstage passes increase in value +3 if 4-1 days are left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 10),Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 13)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 13
      expect(items[0].sell_in).to eq 3
      expect(items[1].quality).to eq 16
      expect(items[1].sell_in).to eq 0
    end

    it 'Backstage passes increase in value +3 but does not go above 50' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
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

    it 'Quality and Sellin of conjured item is decreased by 2' do
      items = [Item.new('Conjured item', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
      expect(items[0].sell_in).to eq 4
    end

    it 'conjured item decreases by four after sell by date' do
      items = [Item.new('Conjured item', -1, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 6
      expect(items[0].sell_in).to eq(-2)
    end

    it 'conjured item stops at 0 even if it should -4 from the quality' do
      items = [Item.new('Conjured item', -1, 3)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq(-2)
    end

    it 'conjured item cannot go below 0 quality' do
      items = [Item.new('conjured item', 10, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq 9
    end

    it 'Updating a list of multiple items' do
      items = [Item.new('apple', 5, 10),Item.new('Conjured item', 5, 20),
      Item.new('Sulfuras, Hand of Ragnaros', 5, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
      expect(items[0].sell_in).to eq 4
      expect(items[1].quality).to eq 18
      expect(items[1].sell_in).to eq 4
      expect(items[2].quality).to eq 80
      expect(items[2].sell_in).to eq 0
    end

    it 'Updating a Aged brie and backstage at the same time' do
      items = [Item.new('Aged Brie', 5, 48),Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 49
      expect(items[0].sell_in).to eq 4
      expect(items[1].quality).to eq 0
      expect(items[1].sell_in).to eq -2
    end
  end
end
