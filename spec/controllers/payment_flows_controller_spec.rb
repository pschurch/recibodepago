require 'spec_helper'

describe PaymentFlowsController do

  def mock_payment_flow(stubs={})
    (@mock_payment_flow ||= mock_model(PaymentFlow).as_null_object).tap do |payment_flow|
      payment_flow.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all payment_flows as @payment_flows" do
      PaymentFlow.stub(:all) { [mock_payment_flow] }
      get :index
      assigns(:payment_flows).should eq([mock_payment_flow])
    end
  end

  describe "GET show" do
    it "assigns the requested payment_flow as @payment_flow" do
      PaymentFlow.stub(:find).with("37") { mock_payment_flow }
      get :show, :id => "37"
      assigns(:payment_flow).should be(mock_payment_flow)
    end
  end

  describe "GET new" do
    it "assigns a new payment_flow as @payment_flow" do
      PaymentFlow.stub(:new) { mock_payment_flow }
      get :new
      assigns(:payment_flow).should be(mock_payment_flow)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_flow as @payment_flow" do
      PaymentFlow.stub(:find).with("37") { mock_payment_flow }
      get :edit, :id => "37"
      assigns(:payment_flow).should be(mock_payment_flow)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created payment_flow as @payment_flow" do
        PaymentFlow.stub(:new).with({'these' => 'params'}) { mock_payment_flow(:save => true) }
        post :create, :payment_flow => {'these' => 'params'}
        assigns(:payment_flow).should be(mock_payment_flow)
      end

      it "redirects to the created payment_flow" do
        PaymentFlow.stub(:new) { mock_payment_flow(:save => true) }
        post :create, :payment_flow => {}
        response.should redirect_to(payment_flow_url(mock_payment_flow))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_flow as @payment_flow" do
        PaymentFlow.stub(:new).with({'these' => 'params'}) { mock_payment_flow(:save => false) }
        post :create, :payment_flow => {'these' => 'params'}
        assigns(:payment_flow).should be(mock_payment_flow)
      end

      it "re-renders the 'new' template" do
        PaymentFlow.stub(:new) { mock_payment_flow(:save => false) }
        post :create, :payment_flow => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested payment_flow" do
        PaymentFlow.should_receive(:find).with("37") { mock_payment_flow }
        mock_payment_flow.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_flow => {'these' => 'params'}
      end

      it "assigns the requested payment_flow as @payment_flow" do
        PaymentFlow.stub(:find) { mock_payment_flow(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:payment_flow).should be(mock_payment_flow)
      end

      it "redirects to the payment_flow" do
        PaymentFlow.stub(:find) { mock_payment_flow(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(payment_flow_url(mock_payment_flow))
      end
    end

    describe "with invalid params" do
      it "assigns the payment_flow as @payment_flow" do
        PaymentFlow.stub(:find) { mock_payment_flow(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:payment_flow).should be(mock_payment_flow)
      end

      it "re-renders the 'edit' template" do
        PaymentFlow.stub(:find) { mock_payment_flow(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested payment_flow" do
      PaymentFlow.should_receive(:find).with("37") { mock_payment_flow }
      mock_payment_flow.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the payment_flows list" do
      PaymentFlow.stub(:find) { mock_payment_flow }
      delete :destroy, :id => "1"
      response.should redirect_to(payment_flows_url)
    end
  end

end
