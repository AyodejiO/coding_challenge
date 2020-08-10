class Checkout
   # constructor
   def initialize(rules)
      @rules = rules #set rules
      @items = Array.new # initialize arrays
   end

   # add items to cart
   def scan(item)
      @items << item
   end

   # Apply promo rules on items
   def applyDiscount
      rules = @rules.select { |obj| obj.getCode != "total" } # get all rules with an item code
      rules.each do |rule|
         size = @items.select { |item| item.getCode == rule.getCode }.size # find the minimum threshold for the rule to apply
         unless rule.getThres > size # if threshold exceeded
            @items.each do |item|  
               if(item.getCode == rule.getCode)  # items that match the rule
                  item.refreshPrice # reset the price to the initial price to revert modifications
                  item.setPrice(rule.getPercent ? item.getPrice * (1-rule.getVal) : item.getPrice - rule.getVal) # compute discount price based on rule
               end
            end
         end
      end
   end

   # Apply promo rules on items
   def computeTotal
      rule = @rules.find{ |obj| obj.getCode == "total" } # get rule for total
      total = @items.inject(0){|sum, x| sum + x.getPrice} # sum item prices
      if rule && total > rule.getThres  # if rule exists and condition is met, apply discount
         total = rule.getPercent ? total * (1-rule.getVal) : total - rule.getVal
      end
      return total
   end

   # print cart total
   def printBill()
      self.applyDiscount
      total = self.computeTotal()
      puts "Total expected price: £#{total.round(2)}"
   end
end