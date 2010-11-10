require 'spec_helper'

describe CollectionTypesController do

  def mock_collection_type(stubs={})
    (@mock_collection_type ||= mock_model(CollectionType).as_null_object).tap do |collection_type|
      collection_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all collection_types as @collection_types" do
      CollectionType.stub(:all) { [mock_collection_type] }
      get :index
      assigns(:collection_types).should eq([mock_collection_type])
    end
  end

  describe "GET show" do
    it "assigns the requested collection_type as @collection_type" do
      CollectionType.stub(:find).with("37") { mock_collection_type }
      get :show, :id => "37"
      assigns(:collection_type).should be(mock_collection_type)
    end
  end

  describe "GET new" do
    it "assigns a new collection_type as @collection_type" do
      CollectionType.stub(:new) { mock_collection_type }
      get :new
      assigns(:collection_type).should be(mock_collection_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested collection_type as @collection_type" do
      CollectionType.stub(:find).with("37") { mock_collection_type }
      get :edit, :id => "37"
      assigns(:collection_type).should be(mock_collection_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created collection_type as @collection_type" do
        CollectionType.stub(:new).with({'these' => 'params'}) { mock_collection_type(:save => true) }
        post :create, :collection_type => {'these' => 'params'}
        assigns(:collection_type).should be(mock_collection_type)
      end

      it "redirects to the created collection_type" do
        CollectionType.stub(:new) { mock_collection_type(:save => true) }
        post :create, :collection_type => {}
        response.should redirect_to(collection_type_url(mock_collection_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved collection_type as @collection_type" do
        CollectionType.stub(:new).with({'these' => 'params'}) { mock_collection_type(:save => false) }
        post :create, :collection_type => {'these' => 'params'}
        assigns(:collection_type).should be(mock_collection_type)
      end

      it "re-renders the 'new' template" do
        CollectionType.stub(:new) { mock_collection_type(:save => false) }
        post :create, :collection_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested collection_type" do
        CollectionType.should_receive(:find).with("37") { mock_collection_type }
        mock_collection_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :collection_type => {'these' => 'params'}
      end

      it "assigns the requested collection_type as @collection_type" do
        CollectionType.stub(:find) { mock_collection_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:collection_type).should be(mock_collection_type)
      end

      it "redirects to the collection_type" do
        CollectionType.stub(:find) { mock_collection_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(collection_type_url(mock_collection_type))
      end
    end

    describe "with invalid params" do
      it "assigns the collection_type as @collection_type" do
        CollectionType.stub(:find) { mock_collection_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:collection_type).should be(mock_collection_type)
      end

      it "re-renders the 'edit' template" do
        CollectionType.stub(:find) { mock_collection_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested collection_type" do
      CollectionType.should_receive(:find).with("37") { mock_collection_type }
      mock_collection_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the collection_types list" do
      CollectionType.stub(:find) { mock_collection_type }
      delete :destroy, :id => "1"
      response.should redirect_to(collection_types_url)
    end
  end

end
