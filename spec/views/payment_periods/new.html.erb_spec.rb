require 'spec_helper'

describe "payment_periods/new.html.erb" do
  before(:each) do
    assign(:payment_period, stub_model(PaymentPeriod,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new payment_period form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => payment_periods_path, :method => "post" do
      assert_select "input#payment_period_name", :name => "payment_period[name]"
      assert_select "textarea#payment_period_description", :name => "payment_period[description]"
      assert_select "input#payment_period_state", :name => "payment_period[state]"
    end
  end
end
