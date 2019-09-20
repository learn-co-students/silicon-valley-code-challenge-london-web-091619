class VentureCapitalist
    @@all = []
    attr_reader :name
    attr_accessor :total_worth, :startup
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        commasclub = []
        @@all.collect{|capitalist| if capitalist.total_worth >1000000000 then commasclub << capitalist end }  
        commasclub  
    end

    def offer_contract(offstartup, type, amount)
        FundingRound.new(offstartup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.capitalist == self}
    end

    def portfolio
        funded = []
        funding_rounds.each{|round| funded << round.startup}
        funded.uniq
    end

    def biggest_investment
        biggestinvest = 0
        biggestround = 0
        funding_rounds.each{|round| if round.investment > biggestinvest then biggestround = round, biggestinvest = round.investment end}
        biggestround
    end

    def invested(domaincheck)
        funded = funding_rounds.select{|round| round.startup.domain == domaincheck} 
        funded.count
    end



    
end
