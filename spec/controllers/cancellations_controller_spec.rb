require 'spec_helper'

describe CancellationsController do

  def mock_cancellation(stubs={})
    (@mock_cancellation ||= mock_model(Cancellation).as_null_object).tap do |cancellation|
      cancellation.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all cancellations as @cancellations" do
      Cancellation.stub(:all) { [mock_cancellation] }
      get :index
      assigns(:cancellations).should eq([mock_cancellation])
    end
  end

  describe "GET show" do
    it "assigns the requested cancellation as @cancellation" do
      Cancellation.stub(:find).with("37") { mock_cancellation }
      get :show, :id => "37"
      assigns(:cancellation).should be(mock_cancellation)
    end
  end

  describe "GET new" do
    it "assigns a new cancellation as @cancellation" do
      Cancellation.stub(:new) { mock_cancellation }
      get :new
      assigns(:cancellation).should be(mock_cancellation)
    end
  end

  describe "GET edit" do
    it "assigns the requested cancellation as @cancellation" do
      Cancellation.stub(:find).with("37") { mock_cancellation }
      get :edit, :id => "37"
      assigns(:cancellation).should be(mock_cancellation)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created cancellation as @cancellation" do
        Cancellation.stub(:new).with({'these' => 'params'}) { mock_cancellation(:save => true) }
        post :create, :cancellation => {'these' => 'params'}
        assigns(:cancellation).should be(mock_cancellation)
      end

      it "redirects to the created cancellation" do
        Cancellation.stub(:new) { mock_cancellation(:save => true) }
        post :create, :cancellation => {}
        response.should redirect_to(cancellation_url(mock_cancellation))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cancellation as @cancellation" do
        Cancellation.stub(:new).with({'these' => 'params'}) { mock_cancellation(:save => false) }
        post :create, :cancellation => {'these' => 'params'}
        assigns(:cancellation).should be(mock_cancellation)
      end

      it "re-renders the 'new' template" do
        Cancellation.stub(:new) { mock_cancellation(:save => false) }
        post :create, :cancellation => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested cancellation" do
        Cancellation.should_receive(:find).with("37") { mock_cancellation }
        mock_cancellation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cancellation => {'these' => 'params'}
      end

      it "assigns the requested cancellation as @cancellation" do
        Cancellation.stub(:find) { mock_cancellation(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cancellation).should be(mock_cancellation)
      end

      it "redirects to the cancellation" do
        Cancellation.stub(:find) { mock_cancellation(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cancellation_url(mock_cancellation))
      end
    end

    describe "with invalid params" do
      it "assigns the cancellation as @cancellation" do
        Cancellation.stub(:find) { mock_cancellation(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cancellation).should be(mock_cancellation)
      end

      it "re-renders the 'edit' template" do
        Cancellation.stub(:find) { mock_cancellation(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested cancellation" do
      Cancellation.should_receive(:find).with("37") { mock_cancellation }
      mock_cancellation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cancellations list" do
      Cancellation.stub(:find) { mock_cancellation }
      delete :destroy, :id => "1"
      response.should redirect_to(cancellations_url)
    end
  end

end
