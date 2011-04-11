require 'spec_helper'

describe "emitters/new.html.erb" do
  before(:each) do
    assign(:emitter, stub_model(Emitter,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new emitter form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => emitters_path, :method => "post" do
      assert_select "input#emitter_name", :name => "emitter[name]"
      assert_select "textarea#emitter_description", :name => "emitter[description]"
      assert_select "input#emitter_state", :name => "emitter[state]"
    end
  end
end
