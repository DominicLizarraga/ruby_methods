module Fundable

  def total_funding_outstanding
    @goal - @funding
  end

  def lost
    @funding -= 15
    "Project #{@name} lost some funds!"
  end

  def got
    @funding += 25
    "Project #{@name} got some funds!"
  end

  def fully_funded?
    total_funding_outstanding <= 0
  end
end
