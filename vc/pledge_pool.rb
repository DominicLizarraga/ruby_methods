Pledge = Struct.new(:name, :amount)

module PledgePool

  PLEDGE = [
    Pledge.new(:bronze, 50),
    Pledge.new(:silver, 75),
    Pledge.new(:gold, 100)
  ]

  def self.random
    PLEDGE.sample
  end

end
