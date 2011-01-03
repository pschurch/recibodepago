require 'spec_helper'

describe ReceiptsController do

  def mock_receipt(stubs={})
    (@mock_receipt ||= mock_model(Receipt).as_null_object).tap do |receipt|
      receipt.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all receipts as @receipts" do
      Receipt.stub(:all) { [mock_receipt] }
      get :index
      assigns(:receipts).should eq([mock_receipt])
    end
  end

  describe "GET show" do
    it "assigns the requested receipt as @receipt" do
      Receipt.stub(:find).with("37") { mock_receipt }
      get :show, :id => "37"
      assigns(:receipt).should be(mock_receipt)
    end
  end

  describe "GET new" do
    it "assigns a new receipt as @receipt" do
      Receipt.stub(:new) { mock_receipt }
      get :new
      assigns(:receipt).should be(mock_receipt)
    end
  end

  describe "GET edit" do
    it "assigns the requested receipt as @receipt" do
      Receipt.stub(:find).with("37") { mock_receipt }
      get :edit, :id => "37"
      assigns(:receipt).should be(mock_receipt)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created receipt as @receipt" do
        Receipt.stub(:new).with({'these' => 'params'}) { mock_receipt(:save => true) }
        post :create, :receipt => {'these' => 'params'}
        assigns(:receipt).should be(mock_receipt)
      end

      it "redirects to the created receipt" do
        Receipt.stub(:new) { mock_receipt(:save => true) }
        post :create, :receipt => {}
        response.should redirect_to(receipt_url(mock_receipt))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved receipt as @receipt" do
        Receipt.stub(:new).with({'these' => 'params'}) { mock_receipt(:save => false) }
        post :create, :receipt => {'these' => 'params'}
        assigns(:receipt).should be(mock_receipt)
      end

      it "re-renders the 'new' template" do
        Receipt.stub(:new) { mock_receipt(:save => false) }
        post :create, :receipt => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested receipt" do
        Receipt.should_receive(:find).with("37") { mock_receipt }
        mock_receipt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :receipt => {'these' => 'params'}
      end

      it "assigns the requested receipt as @receipt" do
        Receipt.stub(:find) { mock_receipt(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:receipt).should be(mock_receipt)
      end

      it "redirects to the receipt" do
        Receipt.stub(:find) { mock_receipt(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(receipt_url(mock_receipt))
      end
    end

    describe "with invalid params" do
      it "assigns the receipt as @receipt" do
        Receipt.stub(:find) { mock_receipt(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:receipt).should be(mock_receipt)
      end

      it "re-renders the 'edit' template" do
        Receipt.stub(:find) { mock_receipt(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested receipt" do
      Receipt.should_receive(:find).with("37") { mock_receipt }
      mock_receipt.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the receipts list" do
      Receipt.stub(:find) { mock_receipt }
      delete :destroy, :id => "1"
      response.should redirect_to(receipts_url)
    end
  end

end
