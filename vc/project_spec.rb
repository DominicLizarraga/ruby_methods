require_relative 'project'

describe Project do
  # has an initial target funding amount
  it "has an initial target funding amount" do
    @project = Project.new("ABC", 500, 3000)
    expect(@project.goal).to eq(3000)
  end
  # computes the total funding outstanding as the target funding amount minus the funding amount
  it "computes the total funding outstanding" do
    @project = Project.new("ABC", 500, 3000)
    expect(@project.goal - @project.funding).to eq(2500)
  end
  # increases funds by 25 when funds are added
  it "increases funds by 25 when funds are added" do
    @project = Project.new("ABC", 500, 3000)
    @project.got
    expect(@project.funding).to eq(525)
  end
  # decreases funds by 15 when funds are removed
  it "decreases funds by 15 when funds are lost" do
    @project = Project.new("ABC", 500, 3000)
    @project.lost
    expect(@project.funding).to eq(485)
  end
  # has a default value of 0 for funding amount
  context "has a default funding value of 0" do
    before do
      @project = Project.new("ABC", 3)
    end
    it "has a default value of 0" do
      expect(@project.funding).to eq(0)
    end
  end

  context "when total funding outstanding is greater than 0" do
    before do
      @project = Project.new("Project ABC", 1000, 5000)
    end

    it "is under-funded" do
      expect(@project.fully_funded?).to eq(false)
    end
  end

  context "when total funding outstanding is less than or equal to 0" do
    before do
      @project = Project.new("Project ABC", 5000, 5000)
    end

    it "is under-funded" do
      expect(@project.fully_funded?).to eq(true)
    end
  end

end
