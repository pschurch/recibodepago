require 'spec_helper'

describe "principals/new.html.erb" do
  before(:each) do
    assign(:principal, stub_model(Principal,
      :name => "MyString",
      :social_reason => "MyString",
      :rut => "MyString",
      :digit => "MyString",
      :contact => "MyString",
      :telephone => "MyString",
      :email => "MyString",
      :state => false
    ).as_new_record)
  end

  it "renders new principal form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => principals_path, :method => "post" do
      assert_select "input#principal_name", :name => "principal[name]"
      assert_select "input#principal_social_reason", :name => "principal[social_reason]"
      assert_select "input#principal_rut", :name => "principal[rut]"
      assert_select "input#principal_digit", :name => "principal[digit]"
      assert_select "input#principal_contact", :name => "principal[contact]"
      assert_select "input#principal_telephone", :name => "principal[telephone]"
      assert_select "input#principal_email", :name => "principal[email]"
      assert_select "input#principal_state", :name => "principal[state]"
    end
  end
end
