require 'pry'

class Startup
  attr_accessor :name,:founder,:domain
  @@all = []

  def initialize(name,founder,domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    @@all.select{|startup| startup.founder == name}
  end

  def pivot(domain,name)
    @domain = domain
    @name = name
  end

  def self.domains
    @@all.map(&:domain).uniq
  end

  def sign_contract(venture_capitalist,type,investment)
    FundingRound.new(self,venture_capitalist,type,investment)
  end

  def all_rounds
    FundingRound.all.select{|round| round.startup == self}
  end

  def num_funding_rounds
    all_rounds.count
  end

  def total_funds
    all_rounds.sum{|round| round.investment}
  end

  def all_investors
    VentureCapitalist.all.select{|investor| investor.startup == self}
  end

  def investors
    all_investors.map(&:venture_capitalist).uniq
  end

  def big_investors
    all_investors.tres_commas_club
  end

end
