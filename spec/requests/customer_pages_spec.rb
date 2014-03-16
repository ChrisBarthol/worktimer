require 'spec_helper'

describe "Customer pages" do

  subject { page }

  describe "customer page" do
    before { visit customer_path }

    it { should have_content('Customer') }
  end
end