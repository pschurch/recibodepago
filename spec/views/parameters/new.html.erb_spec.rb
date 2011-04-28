require 'spec_helper'

describe "parameters/new.html.erb" do
  before(:each) do
    assign(:parameter, stub_model(Parameter,
      :name => "MyString",
      :val_int => 1,
      :val_dec => "9.99",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new parameter form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => parameters_path, :method => "post" do
      assert_select "input#parameter_name", :name => "parameter[name]"
      assert_select "input#parameter_val_int", :name => "parameter[val_int]"
      assert_select "input#parameter_val_dec", :name => "parameter[val_dec]"
      assert_select "textarea#parameter_description", :name => "parameter[description]"
      assert_select "input#parameter_state", :name => "parameter[state]"
    end
  end
end
