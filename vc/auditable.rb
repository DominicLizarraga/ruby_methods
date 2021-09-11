module Auditable

  attr_reader :number

  def audit
    puts "Rolled a #{self.number} (#{self.class})"
  end
end
