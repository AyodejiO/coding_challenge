# Items Class
class Item
    # constructor function
    def initialize(code, name, price)
       # assign instance variables
       @code, @name, @price, @originalPrice = code, name, price, price
    end
 
    # accessor methods
    #get product code
    def getCode
       @code
    end
    
    # get product name
    def getName
       @name
    end
 
    # get product price
    def getPrice
       @price
    end
 
    # setter methods
    #set price of item if discount
    def setPrice(p)
       @price = p
    end
 
    # reset price of item
    def refreshPrice
       @price = @originalPrice
    end
 
    # print object values to string 
    def to_s
       "(code:#@code,name:#@name,price:#@price,originalPrice:#@originalPrice)"  # string formatting of the object.
    end
end