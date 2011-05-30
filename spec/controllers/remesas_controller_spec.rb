require 'spec_helper'

describe RemesasController do

  def mock_remesa(stubs={})
    (@mock_remesa ||= mock_model(Remesa).as_null_object).tap do |remesa|
      remesa.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all remesas as @remesas" do
      Remesa.stub(:all) { [mock_remesa] }
      get :index
      assigns(:remesas).should eq([mock_remesa])
    end
  end

  describe "GET show" do
    it "assigns the requested remesa as @remesa" do
      Remesa.stub(:find).with("37") { mock_remesa }
      get :show, :id => "37"
      assigns(:remesa).should be(mock_remesa)
    end
  end

  describe "GET new" do
    it "assigns a new remesa as @remesa" do
      Remesa.stub(:new) { mock_remesa }
      get :new
      assigns(:remesa).should be(mock_remesa)
    end
  end

  describe "GET edit" do
    it "assigns the requested remesa as @remesa" do
      Remesa.stub(:find).with("37") { mock_remesa }
      get :edit, :id => "37"
      assigns(:remesa).should be(mock_remesa)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created remesa as @remesa" do
        Remesa.stub(:new).with({'these' => 'params'}) { mock_remesa(:save => true) }
        post :create, :remesa => {'these' => 'params'}
        assigns(:remesa).should be(mock_remesa)
      end

      it "redirects to the created remesa" do
        Remesa.stub(:new) { mock_remesa(:save => true) }
        post :create, :remesa => {}
        response.should redirect_to(remesa_url(mock_remesa))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved remesa as @remesa" do
        Remesa.stub(:new).with({'these' => 'params'}) { mock_remesa(:save => false) }
        post :create, :remesa => {'these' => 'params'}
        assigns(:remesa).should be(mock_remesa)
      end

      it "re-renders the 'new' template" do
        Remesa.stub(:new) { mock_remesa(:save => false) }
        post :create, :remesa => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested remesa" do
        Remesa.should_receive(:find).with("37") { mock_remesa }
        mock_remesa.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :remesa => {'these' => 'params'}
      end

      it "assigns the requested remesa as @remesa" do
        Remesa.stub(:find) { mock_remesa(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:remesa).should be(mock_remesa)
      end

      it "redirects to the remesa" do
        Remesa.stub(:find) { mock_remesa(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(remesa_url(mock_remesa))
      end
    end

    describe "with invalid params" do
      it "assigns the remesa as @remesa" do
        Remesa.stub(:find) { mock_remesa(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:remesa).should be(mock_remesa)
      end

      it "re-renders the 'edit' template" do
        Remesa.stub(:find) { mock_remesa(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested remesa" do
      Remesa.should_receive(:find).with("37") { mock_remesa }
      mock_remesa.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the remesas list" do
      Remesa.stub(:find) { mock_remesa }
      delete :destroy, :id => "1"
      response.should redirect_to(remesas_url)
    end
  end

end
