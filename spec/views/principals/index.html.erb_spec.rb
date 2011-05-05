require 'spec_helper'

describe "principals/index.html.erb" do
  before(:each) do
    assign(:principals, [
      stub_model(Principal,
        :name => "Name",
        :social_reason => "Social Reason",
        :rut => "Rut",
        :digit => "Digit",
        :contact => "Contact",
        :telephone => "Telephone",
        :email => "Email",
        :state => false
      ),
      stub_model(Principal,
        :name => "Name",
        :social_reason => "Social Reason",
        :rut => "Rut",
        :digit => "Digit",
        :contact => "Contact",
        :telephone => "Telephone",
        :email => "Email",
        :state => false
      )
    ])
  end

  it "renders a list of principals" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Social Reason".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rut".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Digit".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
