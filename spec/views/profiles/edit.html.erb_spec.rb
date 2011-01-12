require 'spec_helper'

describe "profiles/edit.html.erb" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => profile_path(@profile), :method => "post" do
      assert_select "input#profile_name", :name => "profile[name]"
      assert_select "textarea#profile_description", :name => "profile[description]"
      assert_select "input#profile_state", :name => "profile[state]"
    end
  end
end
