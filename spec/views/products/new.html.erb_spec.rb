require 'spec_helper'

describe "products/new.html.erb" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_state", :name => "product[state]"
    end
  end
end
