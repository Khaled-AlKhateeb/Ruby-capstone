require_relative '../classes/item'
require_relative '../classes/source'

describe Source do
  describe '#new' do
    before :each do
      @source = Source.new('Online')
    end
    it 'create a source object' do
      expect(@source).to be_an_instance_of Source
    end
    describe '#add_item' do
      it 'return non-empty items array' do
        item = Item.new('2022-03-25')
        @source.add_item(item)
        expect(@source.items.empty?).to be false
      end
    end
  end
end
