require_relative 'project'

class GrantProject < Project

  def lost
    @funding -= 0
    puts "#{@name} has not lost or gained funds"
  end

end
