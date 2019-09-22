require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

foo = Startup.new(name: 'foo', founder: 'hehe', domain: 'boyo')
bar = Startup.new(name: 'bar', founder: 'yolo', domain: 'nono')
farrrr = Startup.new(name: 'bar', founder: 'yolo', domain: 'bogo')

john = VentureCapitalist.new(name: 'j', total_worth: 500)
sarah = VentureCapitalist.new(name: 's', total_worth: 5_000_000_000_000_000)
fun = FundingRound.new(startup: foo, venture_capitalist: sarah, type: 'Angel', investment: 50000)

bar.sign_contract(venture_capitalist: john, investment_type: 'Seed', amount_invested: 329)
foo.sign_contract(venture_capitalist: john, investment_type: 'Seed', amount_invested: 329)
john.offer_contract(startup: bar, investment_type: 'Angel', amount: 2000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
