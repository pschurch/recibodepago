require 'spec_helper'

describe RejectionTypesController do

  def mock_rejection_type(stubs={})
    (@mock_rejection_type ||= mock_model(RejectionType).as_null_object).tap do |rejection_type|
      rejection_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all rejection_types as @rejection_types" do
      RejectionType.stub(:all) { [mock_rejection_type] }
      get :index
      assigns(:rejection_types).should eq([mock_rejection_type])
    end
  end

  describe "GET show" do
    it "assigns the requested rejection_type as @rejection_type" do
      RejectionType.stub(:find).with("37") { mock_rejection_type }
      get :show, :id => "37"
      assigns(:rejection_type).should be(mock_rejection_type)
    end
  end

  describe "GET new" do
    it "assigns a new rejection_type as @rejection_type" do
      RejectionType.stub(:new) { mock_rejection_type }
      get :new
      assigns(:rejection_type).should be(mock_rejection_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested rejection_type as @rejection_type" do
      RejectionType.stub(:find).with("37") { mock_rejection_type }
      get :edit, :id => "37"
      assigns(:rejection_type).should be(mock_rejection_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created rejection_type as @rejection_type" do
        RejectionType.stub(:new).with({'these' => 'params'}) { mock_rejection_type(:save => true) }
        post :create, :rejection_type => {'these' => 'params'}
        assigns(:rejection_type).should be(mock_rejection_type)
      end

      it "redirects to the created rejection_type" do
        RejectionType.stub(:new) { mock_rejection_type(:save => true) }
        post :create, :rejection_type => {}
        response.should redirect_to(rejection_type_url(mock_rejection_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rejection_type as @rejection_type" do
        RejectionType.stub(:new).with({'these' => 'params'}) { mock_rejection_type(:save => false) }
        post :create, :rejection_type => {'these' => 'params'}
        assigns(:rejection_type).should be(mock_rejection_type)
      end

      it "re-renders the 'new' template" do
        RejectionType.stub(:new) { mock_rejection_type(:save => false) }
        post :create, :rejection_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested rejection_type" do
        RejectionType.should_receive(:find).with("37") { mock_rejection_type }
        mock_rejection_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rejection_type => {'these' => 'params'}
      end

      it "assigns the requested rejection_type as @rejection_type" do
        RejectionType.stub(:find) { mock_rejection_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:rejection_type).should be(mock_rejection_type)
      end

      it "redirects to the rejection_type" do
        RejectionType.stub(:find) { mock_rejection_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(rejection_type_url(mock_rejection_type))
      end
    end

    describe "with invalid params" do
      it "assigns the rejection_type as @rejection_type" do
        RejectionType.stub(:find) { mock_rejection_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:rejection_type).should be(mock_rejection_type)
      end

      it "re-renders the 'edit' template" do
        RejectionType.stub(:find) { mock_rejection_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested rejection_type" do
      RejectionType.should_receive(:find).with("37") { mock_rejection_type }
      mock_rejection_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the rejection_types list" do
      RejectionType.stub(:find) { mock_rejection_type }
      delete :destroy, :id => "1"
      response.should redirect_to(rejection_types_url)
    end
  end

end
