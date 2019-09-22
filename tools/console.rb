require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup1 = Startup.new("The Big Thingy", "John", "Thingyness")
venturecapitalist1 = VentureCapitalist.new("John",  1000000)
fund1 = startup1.sign_contract(venturecapitalist1, "Angel", 2.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
