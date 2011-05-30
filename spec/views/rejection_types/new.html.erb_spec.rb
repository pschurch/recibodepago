require 'spec_helper'

describe "rejection_types/new.html.erb" do
  before(:each) do
    assign(:rejection_type, stub_model(RejectionType,
      :message => "MyText",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new rejection_type form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => rejection_types_path, :method => "post" do
      assert_select "textarea#rejection_type_message", :name => "rejection_type[message]"
      assert_select "textarea#rejection_type_description", :name => "rejection_type[description]"
      assert_select "input#rejection_type_state", :name => "rejection_type[state]"
    end
  end
end
