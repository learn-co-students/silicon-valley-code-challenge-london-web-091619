class FundingRound

    attr_reader :startup, :venture_capitalist, :investment, :type
    attr_accessor

    @@all = [ ]

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        FundingRound.all << self
    end

    def self.all
        @@all
    end

end
