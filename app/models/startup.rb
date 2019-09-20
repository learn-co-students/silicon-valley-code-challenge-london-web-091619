class Startup
    @@all = []
    attr_accessor :name
    attr_reader :founder, :domain
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        @@all.select {|startup| startup.founder == name}
    end

    def self.domains
        domains = []
        @@all.each{|startup| domains << startup.domain}
        domains.uniq
    end

    def sign_contract(fundcapitalist, type, amount)
        FundingRound.new(self, fundcapitalist, type, amount)
    end

    def num_funding_rounds
        find_our_rounds.count
    end

    def find_our_rounds
        FundingRound.all.select{|round| round.startup == self}
    end
    
    def total_funds
        find_our_rounds.sum{|round| round.investment}
    end

    def investors
        investors = []
        find_our_rounds.each{|round| investors << round.capitalist}
        investors.uniq
    end

    def big_investors
        investors.select{|investor| if VentureCapitalist.tres_commas_club.include?(investor) then investor  end} 
    end
end
