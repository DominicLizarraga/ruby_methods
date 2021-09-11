require_relative 'fundable'

class Project
  include Fundable

    attr_reader :funding, :goal
    attr_accessor :name
  def initialize(name, funding=0, goal)

    @name = name
    @funding = funding
    @goal = goal
    @received_pledge = Hash.new(0)
  end

  def still_needed
    @goal - @funding
  end

  def to_s
    "Project #{@name} has a funding of $#{@funding} towards a goal of $#{@goal}."
  end

  def received_pledge(pledge)
    @received_pledge[pledge] += pledge.amount
    puts "#{@name} received a #{pledge.name} pledge worth #{pledge.amount}"
    puts "#{@name}'s pledge: #{@received_pledge}"
  end

  def each_received_pledge
    @received_pledge.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end

  def pledges
    @received_pledge.values.reduce(0, :+)
  end

  def total_funds
    @funding + pledges
  end
end








