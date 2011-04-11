require 'spec_helper'

describe "emitters/edit.html.erb" do
  before(:each) do
    @emitter = assign(:emitter, stub_model(Emitter,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders the edit emitter form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => emitter_path(@emitter), :method => "post" do
      assert_select "input#emitter_name", :name => "emitter[name]"
      assert_select "textarea#emitter_description", :name => "emitter[description]"
      assert_select "input#emitter_state", :name => "emitter[state]"
    end
  end
end
