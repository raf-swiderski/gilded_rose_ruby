# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end

    it "never has a negative quality" do
      items = [Item.new("+5 Dexterity Vest", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be >= 0
    end

    it "when the sell-by date passes, quality decreases twice as fast" do
      items = [Item.new("Bread", sell_in=-1, quality=10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it "tests if aged brie increases in quality" do
      items = [Item.new("Aged Brie", sell_in=2, quality=0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it "tests if Elixir of the Mongoose increases in quality" do
      items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 6
    end

    it "The quality of an item is never more than 50" do
      items = [Item.new("Aged Brie", sell_in=2, quality=0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it "Sulfuras never decreases in quality (1)" do
      items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=1, quality=80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end

    it "Sulfuras never decreases in quality (-1)" do
      items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end

    it "backstage passes increases in Quality as it’s sell_in value approaches" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be > 20
    end

    it "backstage passes quality increases by 2 if the sell_in value is 10 or less" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 42
    end

    it "the maximum quality is 50" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=9, quality=49)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "backstage passes quality increases by 3 if the sell_in value is 5 or less (5 days or less until the concert)" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=45)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 48
    end
    
    it "Quality drops to 0 after the concert" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "`Conjured` items degrade in Quality twice as fast as normal items" do
      items = [Item.new(name="Conjured Mana Cake", sell_in=3, quality=6)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
    end






  end

end
