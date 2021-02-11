require 'item'

describe Item do
    describe '#to_s' do
        it 'It should print out the item object in string format' do
            item = Item.new("apple",5,5)
            expect(item.to_s).to eq "#{item.name}, #{item.sell_in}, #{item.quality}"
        end 
    end 
end 