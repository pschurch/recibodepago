require 'spec_helper'

describe "field_users/index.html.erb" do
  before(:each) do
    assign(:field_users, [
      stub_model(FieldUser,
        :rut => "Rut",
        :digit => "Digit",
        :name => "Name",
        :description => "MyText",
        :state => false
      ),
      stub_model(FieldUser,
        :rut => "Rut",
        :digit => "Digit",
        :name => "Name",
        :description => "MyText",
        :state => false
      )
    ])
  end

  it "renders a list of field_users" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rut".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Digit".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
