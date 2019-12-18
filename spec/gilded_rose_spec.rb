require  'gilded_rose'

describe GildedRose do
  items = [Item.new("foo", 0, 0), Item.new("beans", 1, 1), Item.new("Sulfuras, Hand of Ragnaros", 40, 40)]

  before(:all) do
    gildedrose = GildedRose.new(items)
    @result = gildedrose.update_quality
  end

  describe "#update_quality" do
    it 'decreases quality by 1 for standard products' do
      expect(@result[1].quality).to eq 0
    end

    it 'does not decrease quality below 0' do
      expect(@result[0].quality).to eq 0
    end

    it "does not change the name" do
      expect(@result[0].name).to eq "foo"
    end

    it 'decreases sell_in by 1 for standard items' do
      expect(@result[0].sell_in).to eq -1
    end

    it 'does not change sell_in or quality for Sulfuras' do
      expect(@result[2].sell_in).to eq 40
      expect(@result[2].quality).to eq 40
    end
  end
end
