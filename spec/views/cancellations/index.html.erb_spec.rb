require 'spec_helper'

describe "cancellations/index.html.erb" do
  before(:each) do
    assign(:cancellations, [
      stub_model(Cancellation,
        :message => "MyText",
        :description => "MyText",
        :state => false
      ),
      stub_model(Cancellation,
        :message => "MyText",
        :description => "MyText",
        :state => false
      )
    ])
  end

  it "renders a list of cancellations" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
