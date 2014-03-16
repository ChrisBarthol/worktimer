require 'spec_helper'

describe Project do
  let(:user) { FactoryGirl.create(:user) }
  let(:customer) {FactoryGirl.create(:customer) }

  before { @project = customer.projects.build(name: "Cool Project", description: "working on a cool proj") }

  subject { @project }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:customer_id) }
  it { should respond_to(:customer) }
  its(:customer) { should eq customer }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @project.customer_id = nil }
    it { should_not be_valid }
  end

  describe "when project name is not present" do
  	before { @project.name = nil }
  	it { should_not be_valid }
  end
end
