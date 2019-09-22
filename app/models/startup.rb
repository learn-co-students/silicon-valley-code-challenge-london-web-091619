class Startup
  attr_reader :name, :founder, :domain

  @@all = []

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    all.find { |startup| startup.founder.eql?(founder) }
  end

  def self.domains
    all.map(&:domain).uniq
  end

  def save
    self.class.all << self
  end

  def initialize(name:, founder:, domain:)
    @name = name
    @founder = founder
    @domain = domain
    save
  end

  def pivot(domain:, name:)
    @domain = domain
    @name = name
  end

  def sign_contract(venture_capitalist:, investment_type:, amount_invested:)
    FundingRound.new(startup: self, venture_capitalist: venture_capitalist, type: investment_type, investment: amount_invested)
  end

  def funding_rounds
    FundingRound.all.select { |funding_round| funding_round.startup.eql?(self) }
  end

  def funding_round_amounts
    funding_rounds.map(&:investment)
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    funding_round_amounts.reduce(:+)
  end

  def investors
    funding_rounds.map(&:venture_capitalist).uniq
  end

  def big_investors
    investors & VentureCapitalist.tres_commas_club
  end
end
