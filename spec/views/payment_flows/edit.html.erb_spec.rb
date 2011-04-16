require 'spec_helper'

describe "payment_flows/edit.html.erb" do
  before(:each) do
    @payment_flow = assign(:payment_flow, stub_model(PaymentFlow,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders the edit payment_flow form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => payment_flow_path(@payment_flow), :method => "post" do
      assert_select "input#payment_flow_name", :name => "payment_flow[name]"
      assert_select "textarea#payment_flow_description", :name => "payment_flow[description]"
      assert_select "input#payment_flow_state", :name => "payment_flow[state]"
    end
  end
end
