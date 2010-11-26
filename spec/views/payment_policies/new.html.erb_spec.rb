require 'spec_helper'

describe "payment_policies/new.html.erb" do
  before(:each) do
    assign(:payment_policy, stub_model(PaymentPolicy,
      :principal_id => 1,
      :product_id => 1,
      :collection_type_id => 1,
      :arrear_interest => 1,
      :term_interest => 1,
      :fee => 1,
      :description => "MyText",
      :state => false,
      :legal_costs => false,
      :installment => false
    ).as_new_record)
  end

  it "renders new payment_policy form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => payment_policies_path, :method => "post" do
      assert_select "input#payment_policy_principal_id", :name => "payment_policy[principal_id]"
      assert_select "input#payment_policy_product_id", :name => "payment_policy[product_id]"
      assert_select "input#payment_policy_collection_type_id", :name => "payment_policy[collection_type_id]"
      assert_select "input#payment_policy_arrear_interest", :name => "payment_policy[arrear_interest]"
      assert_select "input#payment_policy_term_interest", :name => "payment_policy[term_interest]"
      assert_select "input#payment_policy_fee", :name => "payment_policy[fee]"
      assert_select "textarea#payment_policy_description", :name => "payment_policy[description]"
      assert_select "input#payment_policy_state", :name => "payment_policy[state]"
      assert_select "input#payment_policy_legal_costs", :name => "payment_policy[legal_costs]"
      assert_select "input#payment_policy_installment", :name => "payment_policy[installment]"
    end
  end
end
