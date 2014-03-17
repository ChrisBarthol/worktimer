require 'spec_helper'

describe Task do

  let(:user) { FactoryGirl.create(:user) }
  let(:customer) { FactoyrGirl.create(:customer) }
  let(:project) {  FactoryGirl.create(:project) }
  before { @task = user.tasks.build(dtstart: "1-10-2011 9:00:00", dtstop: "1-10-2011 11:00:00", user_id: user.id, project_id: project.id, customer_id: project.customer_id, 
    	totaltime: 4, description: "Some description") }

  subject { @task }

  it { should respond_to(:dtstart) }
  it { should respond_to(:dtstop) }
  it { should respond_to(:user_id) }
  it { should respond_to(:project_id) }
  it { should respond_to(:customer_id) }
  it { should respond_to(:totaltime) }
  it { should respond_to(:description) }
  it { should respond_to(:taskdate) }


  it { should be_valid }

  describe "when user_id is not present" do
    before { @task.user_id = nil }
    it { should_not be_valid }
  end

  describe "when project_id is not present" do
    before { @task.project_id = nil }
    it { should_not be_valid }
  end

  describe "when customer_id is not present" do
    before { @task.customer_id = nil }
    it { should_not be_valid }
  end

  describe "when dtstart is not present" do
    before { @task.dtstart = nil }
    it { should_not be_valid }
  end

  describe "when totaltime is not present" do
    before { @task.totaltime = nil }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @task.description = nil }
    it { should_not be_valid }
  end

end