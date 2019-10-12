class Startup

    attr_reader :founder, :domain
    attr_accessor :name

@@all = [ ]

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        Startup.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name= name
    end

    def self.find_by_founder(founder_name)
        Startup.all.select { |startup| startup.founder == founder_name}
    end

    def self.domains
        Startup.all.map { |su| su.domain}
    end

    def sign_contract(venture_capitalist, investment, amount_invested)
        #given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
        FundingRound.new(self, venture_capitalist, investment, amount_invested.to_f)
    end

    def num_of_funding_rounds
        #Returns the total number of funding rounds that the startup has gotten
        FundingRound.all.select  { |fr| fr.startup == self}
    end

    def total_funds
        #Returns the total sum of investments that the startup has gotten
        num_of_funding_rounds.map { |fr| fr.investment}.sum
    end

    def investors
        # Returns a unique array of all the venture capitalists that have invested in this company
        num_of_funding_rounds.map { |fr| fr.venture_capitalist}
    end

    def big_investors
        #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
        investors.select { |vc| vc.total_worth > 1000000000}
    end

end
