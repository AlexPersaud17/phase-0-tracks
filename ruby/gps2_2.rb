

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza") 
# steps: 
  # split input string it into individual elements of an hash
  # set default quantity of keys 
  # print the list to the console [print, puts, p]
# output: hash

def grocery_creator(groceries)
  grocery_array = groceries.split
  grocery_hash = {}
  grocery_array.each {|grocery_item| grocery_hash[grocery_item] = 1}
  grocery_hash
end


# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: add item and quantity to list
# output: hash

def add_grocery_item(grocery_list, grocery_item, quantity = 1)
 grocery_list[grocery_item] = quantity
 grocery_list 
end

# Method to remove an item from the list
# input: list, item name
# steps:  remove item name
# output: new hash

def remove_grocery_item(grocery_list, grocery_item)
   grocery_list.delete(grocery_item)
   grocery_list
end


# Method to update the quantity of an item
# input:  list, item name, new quantity
# steps:  update value of item name
# output: new hash

def update_grocery_quantity(grocery_list, grocery_item, quantity)
 grocery_list[grocery_item] = quantity 
 grocery_list
end

# Method to print a list and make it look pretty
# input:  grocery list
# steps: iterate through list and print them 
# output: strings

def print_list(grocery_list)
 grocery_list.each do |grocery_item, quantity|
 	puts "You need #{quantity} #{grocery_item}"
 end
 end


# Driver code
grocery_list = grocery_creator("carrots apples cereal pizza")
add_grocery_item(grocery_list, "lemonade", 2)
add_grocery_item(grocery_list, "tomato", 3)
add_grocery_item(grocery_list, "onion", 1)
add_grocery_item(grocery_list, "ice cream", 4)
remove_grocery_item(grocery_list, "lemonade")
update_grocery_quantity(grocery_list, "ice cream", 1)
print print_list(grocery_list)


# REFLECTION
=begin


What did you learn about pseudocode from working on this challenge?
-Being specific really makes the actual coding much easier.

What are the tradeoffs of using arrays and hashes for this challenge?
-Hashes can store more information, in this case, having a quantity as they value for the key called the grovery item.

What does a method return?
-The last line of the method.

What kind of things can you pass into methods as arguments?
-You can pass full data structures as arguments in methods ie arrays and hashes.

How can you pass information between methods?
-Return the value of the method and store that return value use in another method.

What concepts were solidified in this challenge, and what concepts are still confusing?
-Transferring data between methods are now simple to me, previously I had trouble with it.


=end