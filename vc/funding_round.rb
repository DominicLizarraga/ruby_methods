require_relative 'project'
require_relative 'die'
require_relative 'pledge_pool'


module FundingRound

  def self.one_round(name)
    die = Die.new
      numer_rolled = die.roll
      if numer_rolled.odd?
        name.lost
      else
        name.got
      end
  pledge = PledgePool.random
  name.received_pledge(pledge)
  end
end
