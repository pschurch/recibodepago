require 'spec_helper'

describe "groups/new.html.erb" do
  before(:each) do
    assign(:group, stub_model(Group,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => groups_path, :method => "post" do
      assert_select "input#group_name", :name => "group[name]"
      assert_select "textarea#group_description", :name => "group[description]"
      assert_select "input#group_state", :name => "group[state]"
    end
  end
end
