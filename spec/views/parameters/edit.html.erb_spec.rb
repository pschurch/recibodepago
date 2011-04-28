require 'spec_helper'

describe "parameters/edit.html.erb" do
  before(:each) do
    @parameter = assign(:parameter, stub_model(Parameter,
      :new_record? => false,
      :name => "MyString",
      :val_int => 1,
      :val_dec => "9.99",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders the edit parameter form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => parameter_path(@parameter), :method => "post" do
      assert_select "input#parameter_name", :name => "parameter[name]"
      assert_select "input#parameter_val_int", :name => "parameter[val_int]"
      assert_select "input#parameter_val_dec", :name => "parameter[val_dec]"
      assert_select "textarea#parameter_description", :name => "parameter[description]"
      assert_select "input#parameter_state", :name => "parameter[state]"
    end
  end
end
