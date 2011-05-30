require 'spec_helper'

describe "field_users/edit.html.erb" do
  before(:each) do
    @field_user = assign(:field_user, stub_model(FieldUser,
      :new_record? => false,
      :rut => "MyString",
      :digit => "MyString",
      :name => "MyString",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders the edit field_user form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => field_user_path(@field_user), :method => "post" do
      assert_select "input#field_user_rut", :name => "field_user[rut]"
      assert_select "input#field_user_digit", :name => "field_user[digit]"
      assert_select "input#field_user_name", :name => "field_user[name]"
      assert_select "textarea#field_user_description", :name => "field_user[description]"
      assert_select "input#field_user_state", :name => "field_user[state]"
    end
  end
end
