
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
  
  def process_order
    print "Enter product type or 'quit' to end: "
    product = gets.chomp
    determine_valid_product(product)
    
    puts ""
    
      
    puts @products[product].name
    @products[product].perform_actions
  
  end

  def run_process_orders

  end
end

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
    @actions.each{ |action| puts action }
  end
end

class Actions
  include Singleton
  
  def run_methods(methods)

  end
  
end

=begin
functions to read the data
=end
def product(text)
  ProcessOrders.instance.add_product text
end

def packing_slip(text)
  action = "packing_slip(#{text})"
  ProcessOrders.instance.add_action(action)
end

def activate
  action = "activate"
  ProcessOrders.instance.add_action(action)

end

def email(text)
  action = "email(#{text})"
  ProcessOrders.instance.add_action(action)

end

def notify(text)
  action = "notify(#{text})"
  ProcessOrders.instance.add_action(action)

end

def pay(text)
  action = "pay(#{text})"
  ProcessOrders.instance.add_action(action)
end

def include_free(text)
  action = "include_free(#{text})"
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

ProcessOrders.instance.process_order
