require 'spec_helper'

describe "payment_periods/edit.html.erb" do
  before(:each) do
    @payment_period = assign(:payment_period, stub_model(PaymentPeriod,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders the edit payment_period form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => payment_period_path(@payment_period), :method => "post" do
      assert_select "input#payment_period_name", :name => "payment_period[name]"
      assert_select "textarea#payment_period_description", :name => "payment_period[description]"
      assert_select "input#payment_period_state", :name => "payment_period[state]"
    end
  end
end
