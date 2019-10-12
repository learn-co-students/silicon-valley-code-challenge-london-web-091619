class VentureCapitalist

    attr_reader
    attr_accessor :name, :total_worth   

    @@all = [ ]

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        VentureCapitalist.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        #returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
        VentureCapitalist.all.select { |vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, investment, amount_invested)
        #given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
        FundingRound.new(startup, self, investment, amount_invested)
    end

    def funding_rounds
        #returns an array of all funding rounds for that venture capitalist
        FundingRound.all.select { |fr| fr.venture_capitalist == self}
    end

    def portfolio
        #Returns a unique list of all startups this venture capitalist has funded
        funding_rounds.map { |fr| fr.startup}
    end

    def biggest_investment
        #returns the largest funding round given by this venture capitalist
        funding_rounds.max_by(1) { |fr| fr.investment}
    end

    def invested(domain)
        #given a domain string, returns the total amount invested in that domain
        current_domain = self.funding_rounds.select { |fr| fr.startup.domain == domain}
        current_domain.map { |round| round.investment}.sum
    end

end
