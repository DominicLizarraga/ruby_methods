require_relative 'funding_round'
require_relative 'project'
require_relative 'die'

class FundRequest
  def initialize(vc_name)
    @vc_name = vc_name
    @projects = []
  end

  def request_funding(rounds)
    puts "There are #{@projects.size} projects to be funded in #{@vc_name}:"
    @projects.each do |name|
      puts name
    end

    pledges = PledgePool::PLEDGE
    puts "\n There are #{pledges.size} pledges available:"
    pledges.each do |pledge|
      puts "#{pledge.name} has a value of #{pledge.amount}"
    end

      1.upto(rounds) do |round|
      @projects.each do |name|
        FundingRound.one_round(name)
        puts name
      end
    end
  end

  def print_name_and_funding(name)
    puts "#{name.name} ($#{name.funding})"
  end

  def print_results
    fully_funded_projects = @projects.select { |project| project.fully_funded? }
    under_funded_projects = @projects.reject { |project| project.fully_funded? }

    puts "\n #{fully_funded_projects.size} Fully-funded Projects:"
    fully_funded_projects.each do |project|
      print_name_and_funding(project)
    end

    puts "\n #{fully_funded_projects.size} Under-funded Projects:"
    under_funded_projects.each do |project|
      print_name_and_funding(project)
    end

    sorted_projects = under_funded_projects.sort { |a, b| a.total_funding_outstanding <=> b.total_funding_outstanding}

    puts "\n #{under_funded_projects.size} Still need your support:"
    sorted_projects.each do |project|
      formatted_name = project.name.ljust(15, ".")
      puts "#{formatted_name} #{project.total_funding_outstanding}"
    end

    @projects.each do |project|
      puts "\n#{project.name}'s pledges:"
      project.each_received_pledge do |pledge|
        puts "#{pledge.amount} in #{pledge.name} pledges"
      end
      puts "#{project.pledges} in total."
    end


  end
  def add_project(p_name)
    @projects << p_name
  end

end



