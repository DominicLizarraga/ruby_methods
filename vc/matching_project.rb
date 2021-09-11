require_relative 'project'

class MatchingProject < Project

  def initialize(name, goal, funding=0)
    super(name, goal, funding)
    @halfway_funded = (goal / 2.0)
  end

  def halfway_funded?
    @halfway_funded <= funding
  end

  def got
    if halfway_funded?
      @funding += (25*2)
      puts "#{@name} has received at least half itf funding" if halfway_funded?
    else
      super
    end
  end

end
