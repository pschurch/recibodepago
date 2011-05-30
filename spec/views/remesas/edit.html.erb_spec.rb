require 'spec_helper'

describe "remesas/edit.html.erb" do
  before(:each) do
    @remesa = assign(:remesa, stub_model(Remesa,
      :new_record? => false,
      :state => "MyString",
      :principal_id => 1,
      :product_id => 1,
      :principal_rs => "MyString",
      :create_by => "MyString",
      :rc_by => "MyString"
    ))
  end

  it "renders the edit remesa form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => remesa_path(@remesa), :method => "post" do
      assert_select "input#remesa_state", :name => "remesa[state]"
      assert_select "input#remesa_principal_id", :name => "remesa[principal_id]"
      assert_select "input#remesa_product_id", :name => "remesa[product_id]"
      assert_select "input#remesa_principal_rs", :name => "remesa[principal_rs]"
      assert_select "input#remesa_create_by", :name => "remesa[create_by]"
      assert_select "input#remesa_rc_by", :name => "remesa[rc_by]"
    end
  end
end
