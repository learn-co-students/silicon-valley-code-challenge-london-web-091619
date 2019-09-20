class FundingRound
    @@all = []
    attr_reader :startup, :capitalist, :type, :investment
    def initialize(startup, capitalist, type, investment)
        @startup = startup
        @capitalist = capitalist
        @type = type
        @investment = investment
        @@all << self
    end
    
    def self.all
        @@all
    end
    
   
end
