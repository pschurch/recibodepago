require 'spec_helper'

describe PrincipalsController do

  def mock_principal(stubs={})
    (@mock_principal ||= mock_model(Principal).as_null_object).tap do |principal|
      principal.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all principals as @principals" do
      Principal.stub(:all) { [mock_principal] }
      get :index
      assigns(:principals).should eq([mock_principal])
    end
  end

  describe "GET show" do
    it "assigns the requested principal as @principal" do
      Principal.stub(:find).with("37") { mock_principal }
      get :show, :id => "37"
      assigns(:principal).should be(mock_principal)
    end
  end

  describe "GET new" do
    it "assigns a new principal as @principal" do
      Principal.stub(:new) { mock_principal }
      get :new
      assigns(:principal).should be(mock_principal)
    end
  end

  describe "GET edit" do
    it "assigns the requested principal as @principal" do
      Principal.stub(:find).with("37") { mock_principal }
      get :edit, :id => "37"
      assigns(:principal).should be(mock_principal)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created principal as @principal" do
        Principal.stub(:new).with({'these' => 'params'}) { mock_principal(:save => true) }
        post :create, :principal => {'these' => 'params'}
        assigns(:principal).should be(mock_principal)
      end

      it "redirects to the created principal" do
        Principal.stub(:new) { mock_principal(:save => true) }
        post :create, :principal => {}
        response.should redirect_to(principal_url(mock_principal))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved principal as @principal" do
        Principal.stub(:new).with({'these' => 'params'}) { mock_principal(:save => false) }
        post :create, :principal => {'these' => 'params'}
        assigns(:principal).should be(mock_principal)
      end

      it "re-renders the 'new' template" do
        Principal.stub(:new) { mock_principal(:save => false) }
        post :create, :principal => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested principal" do
        Principal.should_receive(:find).with("37") { mock_principal }
        mock_principal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :principal => {'these' => 'params'}
      end

      it "assigns the requested principal as @principal" do
        Principal.stub(:find) { mock_principal(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:principal).should be(mock_principal)
      end

      it "redirects to the principal" do
        Principal.stub(:find) { mock_principal(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(principal_url(mock_principal))
      end
    end

    describe "with invalid params" do
      it "assigns the principal as @principal" do
        Principal.stub(:find) { mock_principal(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:principal).should be(mock_principal)
      end

      it "re-renders the 'edit' template" do
        Principal.stub(:find) { mock_principal(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested principal" do
      Principal.should_receive(:find).with("37") { mock_principal }
      mock_principal.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the principals list" do
      Principal.stub(:find) { mock_principal }
      delete :destroy, :id => "1"
      response.should redirect_to(principals_url)
    end
  end

end
