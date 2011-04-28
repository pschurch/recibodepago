require 'spec_helper'

describe ParametersController do

  def mock_parameter(stubs={})
    (@mock_parameter ||= mock_model(Parameter).as_null_object).tap do |parameter|
      parameter.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all parameters as @parameters" do
      Parameter.stub(:all) { [mock_parameter] }
      get :index
      assigns(:parameters).should eq([mock_parameter])
    end
  end

  describe "GET show" do
    it "assigns the requested parameter as @parameter" do
      Parameter.stub(:find).with("37") { mock_parameter }
      get :show, :id => "37"
      assigns(:parameter).should be(mock_parameter)
    end
  end

  describe "GET new" do
    it "assigns a new parameter as @parameter" do
      Parameter.stub(:new) { mock_parameter }
      get :new
      assigns(:parameter).should be(mock_parameter)
    end
  end

  describe "GET edit" do
    it "assigns the requested parameter as @parameter" do
      Parameter.stub(:find).with("37") { mock_parameter }
      get :edit, :id => "37"
      assigns(:parameter).should be(mock_parameter)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created parameter as @parameter" do
        Parameter.stub(:new).with({'these' => 'params'}) { mock_parameter(:save => true) }
        post :create, :parameter => {'these' => 'params'}
        assigns(:parameter).should be(mock_parameter)
      end

      it "redirects to the created parameter" do
        Parameter.stub(:new) { mock_parameter(:save => true) }
        post :create, :parameter => {}
        response.should redirect_to(parameter_url(mock_parameter))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved parameter as @parameter" do
        Parameter.stub(:new).with({'these' => 'params'}) { mock_parameter(:save => false) }
        post :create, :parameter => {'these' => 'params'}
        assigns(:parameter).should be(mock_parameter)
      end

      it "re-renders the 'new' template" do
        Parameter.stub(:new) { mock_parameter(:save => false) }
        post :create, :parameter => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested parameter" do
        Parameter.should_receive(:find).with("37") { mock_parameter }
        mock_parameter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :parameter => {'these' => 'params'}
      end

      it "assigns the requested parameter as @parameter" do
        Parameter.stub(:find) { mock_parameter(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:parameter).should be(mock_parameter)
      end

      it "redirects to the parameter" do
        Parameter.stub(:find) { mock_parameter(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(parameter_url(mock_parameter))
      end
    end

    describe "with invalid params" do
      it "assigns the parameter as @parameter" do
        Parameter.stub(:find) { mock_parameter(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:parameter).should be(mock_parameter)
      end

      it "re-renders the 'edit' template" do
        Parameter.stub(:find) { mock_parameter(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested parameter" do
      Parameter.should_receive(:find).with("37") { mock_parameter }
      mock_parameter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the parameters list" do
      Parameter.stub(:find) { mock_parameter }
      delete :destroy, :id => "1"
      response.should redirect_to(parameters_url)
    end
  end

end
