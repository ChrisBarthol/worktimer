require 'spec_helper'

describe Customer do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @customer = Customer.new(company: "Good Co", address1: "1799 good row", address2: "1789 good row", address3:"1767 good row",
    	city: "columbus", state: "OH", zip: "43210", phone1: "610-123-2443", phone2: "(610) 234-1244", fax1: "614-213-2345", 
    	fax2: "423-234-3444", email: "contact@goodco.com", website: "goodco.com")
  end

  subject { @customer }

  it { should respond_to(:company) }
  it { should respond_to(:address1) }
  it { should respond_to(:address2) }
  it { should respond_to(:address3) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:phone1) }
  it { should respond_to(:phone2) }
  it { should respond_to(:fax1) }
  it { should respond_to(:fax2) }
  it { should respond_to(:email) }
  it { should respond_to(:website) }

  it { should be_valid }

  describe "when company is not present" do
    before { @customer.company = nil }
    it { should_not be_valid }
  end
end