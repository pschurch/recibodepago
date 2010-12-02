require 'spec_helper'

describe "tickets/new.html.erb" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :principal_id => 1,
      :collection_type_id => 1,
      :product_id => 1,
      :user_id => 1,
      :receipt_id => 1,
      :state => "MyString",
      :state_fees => "MyString",
      :group => 1,
      :rut => "MyString",
      :digit => "MyString",
      :name => "MyString",
      :cas_id => "MyString",
      :principal_name => "MyString",
      :collection_type_name => "MyString",
      :payment_description => "MyText",
      :capital => 1,
      :arrear_interest => 1,
      :term_interest => 1,
      :fee => 1,
      :shipping_costs => 1,
      :legal_costs => 1,
      :total_pay => 1,
      :product => "MyString",
      :number => "MyString",
      :emitter => "MyString",
      :ctacte => "MyString",
      :ballot => "MyString",
      :quota_num => "MyString",
      :total_q => "MyString",
      :prepared_by => "MyString",
      :doc_delivery => false,
      :adjust_sup => false,
      :adjust_sup_des => "MyText",
      :adjust_mgt => false,
      :adjust_mgt_des => "MyText",
      :canceled_by => "MyString"
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path, :method => "post" do
      assert_select "input#ticket_principal_id", :name => "ticket[principal_id]"
      assert_select "input#ticket_collection_type_id", :name => "ticket[collection_type_id]"
      assert_select "input#ticket_product_id", :name => "ticket[product_id]"
      assert_select "input#ticket_user_id", :name => "ticket[user_id]"
      assert_select "input#ticket_receipt_id", :name => "ticket[receipt_id]"
      assert_select "input#ticket_state", :name => "ticket[state]"
      assert_select "input#ticket_state_fees", :name => "ticket[state_fees]"
      assert_select "input#ticket_group", :name => "ticket[group]"
      assert_select "input#ticket_rut", :name => "ticket[rut]"
      assert_select "input#ticket_digit", :name => "ticket[digit]"
      assert_select "input#ticket_name", :name => "ticket[name]"
      assert_select "input#ticket_cas_id", :name => "ticket[cas_id]"
      assert_select "input#ticket_principal_name", :name => "ticket[principal_name]"
      assert_select "input#ticket_collection_type_name", :name => "ticket[collection_type_name]"
      assert_select "textarea#ticket_payment_description", :name => "ticket[payment_description]"
      assert_select "input#ticket_capital", :name => "ticket[capital]"
      assert_select "input#ticket_arrear_interest", :name => "ticket[arrear_interest]"
      assert_select "input#ticket_term_interest", :name => "ticket[term_interest]"
      assert_select "input#ticket_fee", :name => "ticket[fee]"
      assert_select "input#ticket_shipping_costs", :name => "ticket[shipping_costs]"
      assert_select "input#ticket_legal_costs", :name => "ticket[legal_costs]"
      assert_select "input#ticket_total_pay", :name => "ticket[total_pay]"
      assert_select "input#ticket_product", :name => "ticket[product]"
      assert_select "input#ticket_number", :name => "ticket[number]"
      assert_select "input#ticket_emitter", :name => "ticket[emitter]"
      assert_select "input#ticket_ctacte", :name => "ticket[ctacte]"
      assert_select "input#ticket_ballot", :name => "ticket[ballot]"
      assert_select "input#ticket_quota_num", :name => "ticket[quota_num]"
      assert_select "input#ticket_total_q", :name => "ticket[total_q]"
      assert_select "input#ticket_prepared_by", :name => "ticket[prepared_by]"
      assert_select "input#ticket_doc_delivery", :name => "ticket[doc_delivery]"
      assert_select "input#ticket_adjust_sup", :name => "ticket[adjust_sup]"
      assert_select "textarea#ticket_adjust_sup_des", :name => "ticket[adjust_sup_des]"
      assert_select "input#ticket_adjust_mgt", :name => "ticket[adjust_mgt]"
      assert_select "textarea#ticket_adjust_mgt_des", :name => "ticket[adjust_mgt_des]"
      assert_select "input#ticket_canceled_by", :name => "ticket[canceled_by]"
    end
  end
end
