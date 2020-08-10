class Checkout
   # constructor
   def initialize(rules)
      # set rules
      @rules = rules 
      # initialize arrays
      @items = Array.new 
   end

   # add items to cart
   def scan(item)
      @items << item
   end

   # Apply promo rules on items
   def applyDiscount
      # get all rules with an item code
      rules = @rules.select { |obj| obj.getCode != "total" } 
      rules.each do |rule|
         # find the minimum threshold for the rule to apply
         size = @items.select { |item| item.getCode == rule.getCode }.size 
         # if threshold is not exceeded
         unless rule.getThreshold > size 
            @items.each do |item|  
               # if item code matches the rule code
               if(item.getCode == rule.getCode)  
                  # reset the price to the initial price to revert modifications
                  item.refreshPrice 
                  # compute discount price based on rule
                  item.setPrice(rule.getPercent ? item.getPrice * (1-rule.getValue) : item.getPrice - rule.getValue) 
               end
            end
         end
      end
   end

   # Apply promo rules on items
   def computeTotal
      # get rule for total
      rule = @rules.find{ |obj| obj.getCode == "total" } 
      # sum item prices
      total = @items.inject(0){|sum, x| sum + x.getPrice} 
      # if rule exists and condition is met, apply discount
      if rule && total > rule.getThreshold  
         total = rule.getPercent ? total * (1-rule.getValue) : total - rule.getValue
      end
      return total
   end

   # print cart total
   def printBill()
      # apply discount
      self.applyDiscount
      # get total
      total = self.computeTotal()
      # print to console
      puts "Total expected price: £#{total.round(2)}"
   end
end