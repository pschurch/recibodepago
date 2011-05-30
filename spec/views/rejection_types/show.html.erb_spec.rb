require 'spec_helper'

describe "rejection_types/show.html.erb" do
  before(:each) do
    @rejection_type = assign(:rejection_type, stub_model(RejectionType,
      :message => "MyText",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
