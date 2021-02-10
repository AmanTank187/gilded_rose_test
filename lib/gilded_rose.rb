class GildedRose

  def initialize(items)
    @items = items
  end

#   def update_quality()
#     @items.each do |item|
#       #If the item name IS NOT Aged brie or backstage... then carry out line 13.
#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             item.quality = item.quality - 1
#           end
#         end
#       else
# #If the item name IS aged brie or backstage.. then do the check on line 18.
#         if item.quality < 50
# #Line 20 will +1 to the quality if the quality is less than 50 if aged brie or backstage is passed. 
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 #Line 25 will add another +1 to quality for backstage if the sellin is less than 11 
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#                 #Line 30 will add a third +1(+3 in total) if the sellin day is less than 6.
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end

#       end
#       # ONE BLOCK OF CODE TO REFAC  
#       #Decrease the sellin day by 1 if its anything other than Sulfuras
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end

#       if item.sell_in < 0
#         if item.name != "Aged Brie" 
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             #This is where backstage pass is set to 0 if the sell_in number is less than 0. 
#             item.quality = 0
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie"
        update_brie(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_backstage(item)
      end 
    end 
  end 


  def update_normal()
    @items.each do |item|
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
        if item.quality > 0
          item.quality -=1
          if item.quality > 0 && item.sell_in < 0
            item.quality -= 1
          end 
        end 
    end 
  end 

  def update_brie(item)
    item.sell_in -= 1
      if item.quality < 50
        item.quality += 1
       end 
  end 

  def update_backstage(item)
        item.sell_in -= 1
        if item.quality < 50
            item.quality += 1
            if item.quality < 50 && item.sell_in < 11
              item.quality += 1
              if item.quality < 50 && item.sell_in < 6
                item.quality += 1
              if item.sell_in < 0
                item.quality = 0
              end 
            end 
          end 
        end  
  end 

end 

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
