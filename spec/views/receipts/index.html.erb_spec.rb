require 'spec_helper'

describe "receipts/index.html.erb" do
  before(:each) do
    assign(:receipts, [
      stub_model(Receipt,
        :state => "State",
        :payment_agreement_id => 1,
        :user_id => 1,
        :contact_id => 1,
        :payment_agreement => "Payment Agreement",
        :total_pay => 1,
        :total_paid => 1,
        :user_name => "User Name",
        :telephone_user => "Telephone User"
      ),
      stub_model(Receipt,
        :state => "State",
        :payment_agreement_id => 1,
        :user_id => 1,
        :contact_id => 1,
        :payment_agreement => "Payment Agreement",
        :total_pay => 1,
        :total_paid => 1,
        :user_name => "User Name",
        :telephone_user => "Telephone User"
      )
    ])
  end

  it "renders a list of receipts" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Agreement".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telephone User".to_s, :count => 2
  end
end
