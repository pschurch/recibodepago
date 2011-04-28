require 'spec_helper'

describe "payment_periods/index.html.erb" do
  before(:each) do
    assign(:payment_periods, [
      stub_model(PaymentPeriod,
        :name => "Name",
        :description => "MyText",
        :state => false
      ),
      stub_model(PaymentPeriod,
        :name => "Name",
        :description => "MyText",
        :state => false
      )
    ])
  end

  it "renders a list of payment_periods" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
