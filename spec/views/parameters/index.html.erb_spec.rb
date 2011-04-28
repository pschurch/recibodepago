require 'spec_helper'

describe "parameters/index.html.erb" do
  before(:each) do
    assign(:parameters, [
      stub_model(Parameter,
        :name => "Name",
        :val_int => 1,
        :val_dec => "9.99",
        :description => "MyText",
        :state => false
      ),
      stub_model(Parameter,
        :name => "Name",
        :val_int => 1,
        :val_dec => "9.99",
        :description => "MyText",
        :state => false
      )
    ])
  end

  it "renders a list of parameters" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
