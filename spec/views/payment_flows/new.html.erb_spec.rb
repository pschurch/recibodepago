require 'spec_helper'

describe "payment_flows/new.html.erb" do
  before(:each) do
    assign(:payment_flow, stub_model(PaymentFlow,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new payment_flow form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => payment_flows_path, :method => "post" do
      assert_select "input#payment_flow_name", :name => "payment_flow[name]"
      assert_select "textarea#payment_flow_description", :name => "payment_flow[description]"
      assert_select "input#payment_flow_state", :name => "payment_flow[state]"
    end
  end
end
