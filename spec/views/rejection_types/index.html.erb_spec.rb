require 'spec_helper'

describe "rejection_types/index.html.erb" do
  before(:each) do
    assign(:rejection_types, [
      stub_model(RejectionType,
        :message => "MyText",
        :description => "MyText",
        :state => false
      ),
      stub_model(RejectionType,
        :message => "MyText",
        :description => "MyText",
        :state => false
      )
    ])
  end

  it "renders a list of rejection_types" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
