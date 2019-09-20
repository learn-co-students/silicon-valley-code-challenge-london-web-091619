require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
start = Startup.new("Startupname", "John", "Domainname")
start2 = Startup.new("Startupna2me", "John2", "2Domainname")
start3 = Startup.new("Startupna3me", "John3", "Domainname")
cap = VentureCapitalist.new("dave",  133)
cap2 = VentureCapitalist.new("not dave",  1010010101000029)
cap3 = VentureCapitalist.new("not also dave",  101001010029)

fund = start.sign_contract(cap, "invest", 2.0)
fund2 = start.sign_contract(cap3, "invest for two", 201.0)

fund3 = cap2.offer_contract(start3, "invest for three", 10.0)
fund3 = cap2.offer_contract(start, "invest for four", 110.0)
fund3 = cap2.offer_contract(start2, "invest for five", 101.0)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line