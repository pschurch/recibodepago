require 'spec_helper'

describe "tickets/index.html.erb" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :principal_id => 1,
        :collection_type_id => 1,
        :product_id => 1,
        :user_id => 1,
        :receipt_id => 1,
        :state => "State",
        :state_fees => "State Fees",
        :group => 1,
        :rut => "Rut",
        :digit => "Digit",
        :name => "Name",
        :cas_id => "Cas",
        :principal_name => "Principal Name",
        :collection_type_name => "Collection Type Name",
        :payment_description => "MyText",
        :capital => 1,
        :arrear_interest => 1,
        :term_interest => 1,
        :fee => 1,
        :shipping_costs => 1,
        :legal_costs => 1,
        :total_pay => 1,
        :product => "Product",
        :number => "Number",
        :emitter => "Emitter",
        :ctacte => "Ctacte",
        :ballot => "Ballot",
        :quota_num => "Quota Num",
        :total_q => "Total Q",
        :prepared_by => "Prepared By",
        :doc_delivery => false,
        :adjust_sup => false,
        :adjust_sup_des => "MyText",
        :adjust_mgt => false,
        :adjust_mgt_des => "MyText",
        :canceled_by => "Canceled By"
      ),
      stub_model(Ticket,
        :principal_id => 1,
        :collection_type_id => 1,
        :product_id => 1,
        :user_id => 1,
        :receipt_id => 1,
        :state => "State",
        :state_fees => "State Fees",
        :group => 1,
        :rut => "Rut",
        :digit => "Digit",
        :name => "Name",
        :cas_id => "Cas",
        :principal_name => "Principal Name",
        :collection_type_name => "Collection Type Name",
        :payment_description => "MyText",
        :capital => 1,
        :arrear_interest => 1,
        :term_interest => 1,
        :fee => 1,
        :shipping_costs => 1,
        :legal_costs => 1,
        :total_pay => 1,
        :product => "Product",
        :number => "Number",
        :emitter => "Emitter",
        :ctacte => "Ctacte",
        :ballot => "Ballot",
        :quota_num => "Quota Num",
        :total_q => "Total Q",
        :prepared_by => "Prepared By",
        :doc_delivery => false,
        :adjust_sup => false,
        :adjust_sup_des => "MyText",
        :adjust_mgt => false,
        :adjust_mgt_des => "MyText",
        :canceled_by => "Canceled By"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State Fees".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rut".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Digit".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cas".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Principal Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Collection Type Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Emitter".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ctacte".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ballot".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Quota Num".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Total Q".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Prepared By".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Canceled By".to_s, :count => 2
  end
end
