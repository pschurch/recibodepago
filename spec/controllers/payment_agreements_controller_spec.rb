require 'spec_helper'

describe PaymentAgreementsController do

  def mock_payment_agreement(stubs={})
    (@mock_payment_agreement ||= mock_model(PaymentAgreement).as_null_object).tap do |payment_agreement|
      payment_agreement.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all payment_agreements as @payment_agreements" do
      PaymentAgreement.stub(:all) { [mock_payment_agreement] }
      get :index
      assigns(:payment_agreements).should eq([mock_payment_agreement])
    end
  end

  describe "GET show" do
    it "assigns the requested payment_agreement as @payment_agreement" do
      PaymentAgreement.stub(:find).with("37") { mock_payment_agreement }
      get :show, :id => "37"
      assigns(:payment_agreement).should be(mock_payment_agreement)
    end
  end

  describe "GET new" do
    it "assigns a new payment_agreement as @payment_agreement" do
      PaymentAgreement.stub(:new) { mock_payment_agreement }
      get :new
      assigns(:payment_agreement).should be(mock_payment_agreement)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_agreement as @payment_agreement" do
      PaymentAgreement.stub(:find).with("37") { mock_payment_agreement }
      get :edit, :id => "37"
      assigns(:payment_agreement).should be(mock_payment_agreement)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created payment_agreement as @payment_agreement" do
        PaymentAgreement.stub(:new).with({'these' => 'params'}) { mock_payment_agreement(:save => true) }
        post :create, :payment_agreement => {'these' => 'params'}
        assigns(:payment_agreement).should be(mock_payment_agreement)
      end

      it "redirects to the created payment_agreement" do
        PaymentAgreement.stub(:new) { mock_payment_agreement(:save => true) }
        post :create, :payment_agreement => {}
        response.should redirect_to(payment_agreement_url(mock_payment_agreement))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_agreement as @payment_agreement" do
        PaymentAgreement.stub(:new).with({'these' => 'params'}) { mock_payment_agreement(:save => false) }
        post :create, :payment_agreement => {'these' => 'params'}
        assigns(:payment_agreement).should be(mock_payment_agreement)
      end

      it "re-renders the 'new' template" do
        PaymentAgreement.stub(:new) { mock_payment_agreement(:save => false) }
        post :create, :payment_agreement => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested payment_agreement" do
        PaymentAgreement.should_receive(:find).with("37") { mock_payment_agreement }
        mock_payment_agreement.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_agreement => {'these' => 'params'}
      end

      it "assigns the requested payment_agreement as @payment_agreement" do
        PaymentAgreement.stub(:find) { mock_payment_agreement(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:payment_agreement).should be(mock_payment_agreement)
      end

      it "redirects to the payment_agreement" do
        PaymentAgreement.stub(:find) { mock_payment_agreement(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(payment_agreement_url(mock_payment_agreement))
      end
    end

    describe "with invalid params" do
      it "assigns the payment_agreement as @payment_agreement" do
        PaymentAgreement.stub(:find) { mock_payment_agreement(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:payment_agreement).should be(mock_payment_agreement)
      end

      it "re-renders the 'edit' template" do
        PaymentAgreement.stub(:find) { mock_payment_agreement(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested payment_agreement" do
      PaymentAgreement.should_receive(:find).with("37") { mock_payment_agreement }
      mock_payment_agreement.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the payment_agreements list" do
      PaymentAgreement.stub(:find) { mock_payment_agreement }
      delete :destroy, :id => "1"
      response.should redirect_to(payment_agreements_url)
    end
  end

end
