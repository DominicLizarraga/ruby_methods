require_relative 'project'
require_relative 'fundrequest'

project1 = Project.new("ABC", 500, 3000)
project2 = Project.new("LMN", 50, 4000)
project3 = Project.new("XYZ", 1800, 3500)
project4 = Project.new("LOG", 1800, 3500)


projects = [project1, project2, project3, project4]

sequoia = FundRequest.new("sequoia")

projects.each do |project|
  sequoia.add_project(project)
end

sequoia.request_funding(3)
sequoia.print_results

