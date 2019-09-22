class VentureCapitalist
  attr_reader :name, :total_worth

  @@all = []

  def self.all
    @@all
  end

  def self.tres_commas_club
    all.select { |venture_capitalist| venture_capitalist.total_worth > 1_000_000_000 }
  end

  def save
    self.class.all << self
  end

  def initialize(name:, total_worth:)
    @name = name
    @total_worth = total_worth
    save
  end

  def offer_contract(startup:, investment_type:, amount:)
    FundingRound.new(startup: startup, venture_capitalist: self, type: investment_type, investment: amount)
  end

  def funding_rounds
    FundingRound.all.select { |funding_round| funding_round.venture_capitalist.eql?(self) }
  end

  def funding_rounds_in_domain(domain)
    funding_rounds.select { |funding_round| funding_round.startup.domain.eql?(domain) }
  end

  def portfolio
    funding_rounds.map(&:startup).uniq
  end

  def biggest_investment
    funding_rounds.max_by { |funding_round| funding_round.investment }
  end

  def invested(domain)
    funding_rounds_in_domain(domain).reduce(0) do |sum, funding_rounds|
      sum + funding_rounds.investment
    end
  end
end
