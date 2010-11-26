require 'spec_helper'

describe "payment_policies/index.html.erb" do
  before(:each) do
    assign(:payment_policies, [
      stub_model(PaymentPolicy,
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
      ),
      stub_model(PaymentPolicy,
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
      )
    ])
  end

  it "renders a list of payment_policies" do
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
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
