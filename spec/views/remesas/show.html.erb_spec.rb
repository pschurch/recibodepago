require 'spec_helper'

describe "remesas/show.html.erb" do
  before(:each) do
    @remesa = assign(:remesa, stub_model(Remesa,
      :state => "State",
      :principal_id => 1,
      :product_id => 1,
      :principal_rs => "Principal Rs",
      :create_by => "Create By",
      :rc_by => "Rc By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Principal Rs/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Create By/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Rc By/)
  end
end
