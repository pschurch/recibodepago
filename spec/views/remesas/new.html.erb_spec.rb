require 'spec_helper'

describe "remesas/new.html.erb" do
  before(:each) do
    assign(:remesa, stub_model(Remesa,
      :state => "MyString",
      :principal_id => 1,
      :product_id => 1,
      :principal_rs => "MyString",
      :create_by => "MyString",
      :rc_by => "MyString"
    ).as_new_record)
  end

  it "renders new remesa form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => remesas_path, :method => "post" do
      assert_select "input#remesa_state", :name => "remesa[state]"
      assert_select "input#remesa_principal_id", :name => "remesa[principal_id]"
      assert_select "input#remesa_product_id", :name => "remesa[product_id]"
      assert_select "input#remesa_principal_rs", :name => "remesa[principal_rs]"
      assert_select "input#remesa_create_by", :name => "remesa[create_by]"
      assert_select "input#remesa_rc_by", :name => "remesa[rc_by]"
    end
  end
end
