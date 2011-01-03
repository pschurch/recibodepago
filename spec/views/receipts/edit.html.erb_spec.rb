require 'spec_helper'

describe "receipts/edit.html.erb" do
  before(:each) do
    @receipt = assign(:receipt, stub_model(Receipt,
      :new_record? => false,
      :state => "MyString",
      :payment_agreement_id => 1,
      :user_id => 1,
      :contact_id => 1,
      :payment_agreement => "MyString",
      :total_pay => 1,
      :total_paid => 1,
      :user_name => "MyString",
      :telephone_user => "MyString"
    ))
  end

  it "renders the edit receipt form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => receipt_path(@receipt), :method => "post" do
      assert_select "input#receipt_state", :name => "receipt[state]"
      assert_select "input#receipt_payment_agreement_id", :name => "receipt[payment_agreement_id]"
      assert_select "input#receipt_user_id", :name => "receipt[user_id]"
      assert_select "input#receipt_contact_id", :name => "receipt[contact_id]"
      assert_select "input#receipt_payment_agreement", :name => "receipt[payment_agreement]"
      assert_select "input#receipt_total_pay", :name => "receipt[total_pay]"
      assert_select "input#receipt_total_paid", :name => "receipt[total_paid]"
      assert_select "input#receipt_user_name", :name => "receipt[user_name]"
      assert_select "input#receipt_telephone_user", :name => "receipt[telephone_user]"
    end
  end
end
