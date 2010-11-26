require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :new_record? => false,
      :user => "MyString",
      :name => "MyString",
      :telephone => "MyString",
      :email => "MyString",
      :description => "MyText",
      :profile_id => 1,
      :group_id => 1,
      :state => false,
      :encrypted_password => "MyString",
      :salt => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => user_path(@user), :method => "post" do
      assert_select "input#user_user", :name => "user[user]"
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_telephone", :name => "user[telephone]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "textarea#user_description", :name => "user[description]"
      assert_select "input#user_profile_id", :name => "user[profile_id]"
      assert_select "input#user_group_id", :name => "user[group_id]"
      assert_select "input#user_state", :name => "user[state]"
      assert_select "input#user_encrypted_password", :name => "user[encrypted_password]"
      assert_select "input#user_salt", :name => "user[salt]"
    end
  end
end
