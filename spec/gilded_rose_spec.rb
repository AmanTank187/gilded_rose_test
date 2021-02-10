require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "Quality and Sellin of regular item is decreased by 1" do
      items = [Item.new("foo", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
      expect(items[0].sell_in).to eq 4
    end

    it "Regular item decreases by two after sell by date" do
      items = [Item.new("foo", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
      expect(items[0].sell_in).to eq -1
    end

    it "Item cannot go below 0 quality" do
      items = [Item.new("foo", 10, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq 9
    end

    it "Checks Sulfuras stays the same" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 10
      expect(items[0].sell_in).to eq 5
    end 

end

end
