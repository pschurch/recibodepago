require 'spec_helper'

describe PaymentPoliciesController do

  def mock_payment_policy(stubs={})
    (@mock_payment_policy ||= mock_model(PaymentPolicy).as_null_object).tap do |payment_policy|
      payment_policy.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all payment_policies as @payment_policies" do
      PaymentPolicy.stub(:all) { [mock_payment_policy] }
      get :index
      assigns(:payment_policies).should eq([mock_payment_policy])
    end
  end

  describe "GET show" do
    it "assigns the requested payment_policy as @payment_policy" do
      PaymentPolicy.stub(:find).with("37") { mock_payment_policy }
      get :show, :id => "37"
      assigns(:payment_policy).should be(mock_payment_policy)
    end
  end

  describe "GET new" do
    it "assigns a new payment_policy as @payment_policy" do
      PaymentPolicy.stub(:new) { mock_payment_policy }
      get :new
      assigns(:payment_policy).should be(mock_payment_policy)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_policy as @payment_policy" do
      PaymentPolicy.stub(:find).with("37") { mock_payment_policy }
      get :edit, :id => "37"
      assigns(:payment_policy).should be(mock_payment_policy)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created payment_policy as @payment_policy" do
        PaymentPolicy.stub(:new).with({'these' => 'params'}) { mock_payment_policy(:save => true) }
        post :create, :payment_policy => {'these' => 'params'}
        assigns(:payment_policy).should be(mock_payment_policy)
      end

      it "redirects to the created payment_policy" do
        PaymentPolicy.stub(:new) { mock_payment_policy(:save => true) }
        post :create, :payment_policy => {}
        response.should redirect_to(payment_policy_url(mock_payment_policy))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_policy as @payment_policy" do
        PaymentPolicy.stub(:new).with({'these' => 'params'}) { mock_payment_policy(:save => false) }
        post :create, :payment_policy => {'these' => 'params'}
        assigns(:payment_policy).should be(mock_payment_policy)
      end

      it "re-renders the 'new' template" do
        PaymentPolicy.stub(:new) { mock_payment_policy(:save => false) }
        post :create, :payment_policy => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested payment_policy" do
        PaymentPolicy.should_receive(:find).with("37") { mock_payment_policy }
        mock_payment_policy.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_policy => {'these' => 'params'}
      end

      it "assigns the requested payment_policy as @payment_policy" do
        PaymentPolicy.stub(:find) { mock_payment_policy(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:payment_policy).should be(mock_payment_policy)
      end

      it "redirects to the payment_policy" do
        PaymentPolicy.stub(:find) { mock_payment_policy(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(payment_policy_url(mock_payment_policy))
      end
    end

    describe "with invalid params" do
      it "assigns the payment_policy as @payment_policy" do
        PaymentPolicy.stub(:find) { mock_payment_policy(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:payment_policy).should be(mock_payment_policy)
      end

      it "re-renders the 'edit' template" do
        PaymentPolicy.stub(:find) { mock_payment_policy(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested payment_policy" do
      PaymentPolicy.should_receive(:find).with("37") { mock_payment_policy }
      mock_payment_policy.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the payment_policies list" do
      PaymentPolicy.stub(:find) { mock_payment_policy }
      delete :destroy, :id => "1"
      response.should redirect_to(payment_policies_url)
    end
  end

end
