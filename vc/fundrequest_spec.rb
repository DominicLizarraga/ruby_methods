require_relative 'fundrequest'
require_relative 'project'
require_relative 'die'



describe FundRequest do

  before do
    @fundrequest = FundRequest.new("VC-Friendly Start-up Projects")

    @initial_funds = 1000

    @project = Project.new("DGLC", @initial_funds, 5000)

    @fundrequest.add_project(@project)

  end

  it "adds funds to a project if an even number is rolled" do
    Die.any_instance.stub(:roll).and_return(4)

    @fundrequest.request_funding

    expect(@project.funding).to eq(@initial_funds + 25)
  end

  it "removes funds to a project if an odd number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)

    @fundrequest.request_funding

    expect(@project.funding).to eq(@initial_funds - 15)

  end




end



