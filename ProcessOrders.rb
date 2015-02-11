
require 'singleton'

class ProcessOrders
  include Singleton


  def initialize
    @products = {}
    @current_product
  end

  def add_product(product)
    #add product to hash if does not exist
    @products[product] = Product.new(product) unless @products.has_key?(product)
    
    #set current product equal to product parsed
    @current_product = product
  end

  def add_action(action)
    @products[@current_product].actions = action
  end

  #exception
  def determine_valid_product(product)
    if @products.has_key?(product)
      product
    else
      #throw error
    end
  end
  
  def process_order(product)
    puts ""
      
    puts @products[product].name
    @products[product].perform_actions
    
    puts ""
  end

  def run_process_orders
    print "Enter product type or 'quit' to end: "
    product = gets.chomp
    if(product == "quit")
      
    else
      #determine if valid
      determine_valid_product product
      process_order product
      run_process_orders
    end
  end
end
=begin
Actions manager class used to evaluate valid actions and perform actions
=end
class ActionsManager
  include Singleton
  
  def initialize

  end

  def packing_slip(dept)
    puts "---- Packing slip for #{dept}"
  end

  def activate
    puts "---- Activating membership"
  end

  def email(recipient)
    puts "---- Emailing #{recipient}"
  end

  def notify(recipient)
    puts "---- Notifying #{recipient}"
  end

  def pay(who)
    puts "---- Paying #{who}"
  end

  def include_free(what)
    puts "---- Including free #{what}"
  end

  def include_discount
    puts "---- Including discount coupon"
  end

  def warranty
    puts "---- Adding warranty"
  end
end

=begin
Product class used to store associated actions with a product
=end
class Product
  attr_reader :name, :actions
   
  def initialize(name)
    @name = name
    @actions = []
  end
  
  #adds action to actions array associated with product
  def actions=(action)
    @actions << action 
  end
 
  def perform_actions
    @actions.each{ |action|  
      ActionsManager.instance.instance_eval(action)
    }
  end
end

=begin
functions to read the data
=end
def product(text)
  ProcessOrders.instance.add_product text
end

def packing_slip(text)
  action = "packing_slip('#{text}')"
  ProcessOrders.instance.add_action(action)
end

def activate
  action = "activate"
  ProcessOrders.instance.add_action(action)

end

def email(text)
  action = "email('#{text}')"
  ProcessOrders.instance.add_action(action)

end

def notify(text)
  action = "notify('#{text}')"
  ProcessOrders.instance.add_action(action)

end

def pay(text)
  action = "pay('#{text}')"
  ProcessOrders.instance.add_action(action)
end

def include_free(text)
  action = "include_free('#{text}')"
  ProcessOrders.instance.add_action(action)
end

def include_discount
  action = "include_discount"
  ProcessOrders.instance.add_action(action)
end

def warranty
  action = "warranty"
  ProcessOrders.instance.add_action(action)
end

load 'businessRules.txt'

ProcessOrders.instance.run_process_orders
