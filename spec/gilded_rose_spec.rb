require  'gilded_rose'

describe GildedRose do
  items = [Item.new("foo", 0, 0), Item.new("beans", 1, 1)]
  let(:gildedrose) { GildedRose.new(items) }

  describe "#update_quality" do
    it 'decreases quality by 1 for standard products' do
      expect { gildedrose.update_quality }.to change { items[1].quality }.by(-1)
    end

    it 'does not decrease quality when it is 0' do
      expect { gildedrose.update_quality }.to change { items[0].quality }.by(0)
    end

    it "does not change the name" do
      gildedrose.update_quality
      expect(items[0].name).to eq "foo"
    end

    it 'decreases sell_in by 1 for standard items' do
      expect { gildedrose.update_quality }.to change { items[0].sell_in }.by(-1)
    end
  end
end
