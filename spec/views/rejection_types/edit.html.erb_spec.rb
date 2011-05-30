require 'spec_helper'

describe "rejection_types/edit.html.erb" do
  before(:each) do
    @rejection_type = assign(:rejection_type, stub_model(RejectionType,
      :new_record? => false,
      :message => "MyText",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders the edit rejection_type form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => rejection_type_path(@rejection_type), :method => "post" do
      assert_select "textarea#rejection_type_message", :name => "rejection_type[message]"
      assert_select "textarea#rejection_type_description", :name => "rejection_type[description]"
      assert_select "input#rejection_type_state", :name => "rejection_type[state]"
    end
  end
end
