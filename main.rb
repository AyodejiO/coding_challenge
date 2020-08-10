# Class Files
require './Checkout.rb'
require './Item.rb'
require './Rule.rb'
 
#rules
rule_1 = Rule.new("total", true, 60, 10)
rule_2 = Rule.new("001", false, 2, 0.75)

#create Items
item_001 = Item.new("001", "Lavender heart", 9.25)
item_002 = Item.new("002", "Personalised cufflinks", 45)
item_003 = Item.new("003", "Kids T-shirt", 19.95)

# Create Checkout object
co = Checkout.new([rule_1, rule_2])

# Test Cases
co.scan(item_001)
co.scan(item_002)
co.scan(item_003)
# co.scan(item_001)

# Print Bill
co.printBill()