require 'spec_helper'

describe PaymentPeriodsController do

  def mock_payment_period(stubs={})
    (@mock_payment_period ||= mock_model(PaymentPeriod).as_null_object).tap do |payment_period|
      payment_period.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all payment_periods as @payment_periods" do
      PaymentPeriod.stub(:all) { [mock_payment_period] }
      get :index
      assigns(:payment_periods).should eq([mock_payment_period])
    end
  end

  describe "GET show" do
    it "assigns the requested payment_period as @payment_period" do
      PaymentPeriod.stub(:find).with("37") { mock_payment_period }
      get :show, :id => "37"
      assigns(:payment_period).should be(mock_payment_period)
    end
  end

  describe "GET new" do
    it "assigns a new payment_period as @payment_period" do
      PaymentPeriod.stub(:new) { mock_payment_period }
      get :new
      assigns(:payment_period).should be(mock_payment_period)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_period as @payment_period" do
      PaymentPeriod.stub(:find).with("37") { mock_payment_period }
      get :edit, :id => "37"
      assigns(:payment_period).should be(mock_payment_period)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created payment_period as @payment_period" do
        PaymentPeriod.stub(:new).with({'these' => 'params'}) { mock_payment_period(:save => true) }
        post :create, :payment_period => {'these' => 'params'}
        assigns(:payment_period).should be(mock_payment_period)
      end

      it "redirects to the created payment_period" do
        PaymentPeriod.stub(:new) { mock_payment_period(:save => true) }
        post :create, :payment_period => {}
        response.should redirect_to(payment_period_url(mock_payment_period))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_period as @payment_period" do
        PaymentPeriod.stub(:new).with({'these' => 'params'}) { mock_payment_period(:save => false) }
        post :create, :payment_period => {'these' => 'params'}
        assigns(:payment_period).should be(mock_payment_period)
      end

      it "re-renders the 'new' template" do
        PaymentPeriod.stub(:new) { mock_payment_period(:save => false) }
        post :create, :payment_period => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested payment_period" do
        PaymentPeriod.should_receive(:find).with("37") { mock_payment_period }
        mock_payment_period.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_period => {'these' => 'params'}
      end

      it "assigns the requested payment_period as @payment_period" do
        PaymentPeriod.stub(:find) { mock_payment_period(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:payment_period).should be(mock_payment_period)
      end

      it "redirects to the payment_period" do
        PaymentPeriod.stub(:find) { mock_payment_period(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(payment_period_url(mock_payment_period))
      end
    end

    describe "with invalid params" do
      it "assigns the payment_period as @payment_period" do
        PaymentPeriod.stub(:find) { mock_payment_period(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:payment_period).should be(mock_payment_period)
      end

      it "re-renders the 'edit' template" do
        PaymentPeriod.stub(:find) { mock_payment_period(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested payment_period" do
      PaymentPeriod.should_receive(:find).with("37") { mock_payment_period }
      mock_payment_period.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the payment_periods list" do
      PaymentPeriod.stub(:find) { mock_payment_period }
      delete :destroy, :id => "1"
      response.should redirect_to(payment_periods_url)
    end
  end

end
