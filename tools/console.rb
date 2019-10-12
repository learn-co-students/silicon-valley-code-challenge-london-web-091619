require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Lobster", "Bogo M", "bog_lobster")
s2 = Startup.new("Macaroni", "Niki D" , "bog_macaroni")
s3 = Startup.new("Salad", "Dom C", "bog_salad")

vc1 = VentureCapitalist.new("John Dough", 1000000000000)
vc2 = VentureCapitalist.new("Bob Dough", 1000000)
vc3 = VentureCapitalist.new("Snow Dough", 100000)

f1 = FundingRound.new(s1, vc1, "serie A", 10000)
f2 = FundingRound.new(s2, vc3, "serie C", 100000)
f3 = FundingRound.new(s3, vc2, "serie D", 1000)








binding.pry
0 #leave this here to ensure binding.pry isn't the last line