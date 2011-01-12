require 'spec_helper'

describe "profiles/new.html.erb" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path, :method => "post" do
      assert_select "input#profile_name", :name => "profile[name]"
      assert_select "textarea#profile_description", :name => "profile[description]"
      assert_select "input#profile_state", :name => "profile[state]"
    end
  end
end
