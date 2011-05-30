require 'spec_helper'

describe "remesas/index.html.erb" do
  before(:each) do
    assign(:remesas, [
      stub_model(Remesa,
        :state => "State",
        :principal_id => 1,
        :product_id => 1,
        :principal_rs => "Principal Rs",
        :create_by => "Create By",
        :rc_by => "Rc By"
      ),
      stub_model(Remesa,
        :state => "State",
        :principal_id => 1,
        :product_id => 1,
        :principal_rs => "Principal Rs",
        :create_by => "Create By",
        :rc_by => "Rc By"
      )
    ])
  end

  it "renders a list of remesas" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Principal Rs".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Create By".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rc By".to_s, :count => 2
  end
end
