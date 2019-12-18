require  'gilded_rose'

describe GildedRose do
  items = [Item.new("foo", 0, 1), Item.new("Sulfuras, Hand of Ragnaros", 40, 40),
  Item.new("Aged Brie", 10, 10), Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 30),
  Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 30), Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 30),
  Item.new("beans", -2, 4), Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 30) ]

  before(:all) do
    gildedrose = GildedRose.new(items)
    @result = gildedrose.update_quality
  end

  describe "#update_quality" do
    context 'for all items' do
      it "does not change the name" do
        expect(@result[0].name).to eq "foo"
      end

      it 'does not decrease quality below 0' do
        expect(@result[0].quality).to eq 0
      end
    end

    context 'for standard items' do
      it 'decreases sell_in by 1' do
        expect(@result[0].sell_in).to eq -1
      end

      it 'decreases quality by 1' do
        expect(@result[0].quality).to eq 0
      end

      it 'decreases quality by 2 when sell by date passed' do
        expect(@result[6].quality).to eq 2
      end
    end

    context 'for Sulfuras items' do
      it 'does not change sell_in or quality' do
        expect(@result[1].sell_in).to eq 40
        expect(@result[1].quality).to eq 40
      end
    end

    context 'for Aged Brie' do
      it 'increases quality by 1' do
        expect(@result[2].quality).to eq 11
      end
    end

    context 'for backstage pass' do
      it 'increases quality by 1 if more than 10 days until the concert' do
        expect(@result[3].quality).to eq 31
      end

      it 'increases quality by 2 when less than 11 days until concert' do
        expect(@result[4].quality).to eq 32
      end

      it 'increases quality by 3 when less than 6 days until concert' do
        expect(@result[5].quality).to eq 33
      end

      it 'drops quality to 0 after the concert' do
        expect(@result[7].quality).to eq 0
      end
    end
  end
end
