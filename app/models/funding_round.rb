class FundingRound
  attr_reader :startup, :venture_capitalist, :type, :investment

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(startup:, venture_capitalist:, type:, investment:)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment
    save
  end
end
