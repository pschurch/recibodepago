require 'spec_helper'

describe EmittersController do

  def mock_emitter(stubs={})
    (@mock_emitter ||= mock_model(Emitter).as_null_object).tap do |emitter|
      emitter.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all emitters as @emitters" do
      Emitter.stub(:all) { [mock_emitter] }
      get :index
      assigns(:emitters).should eq([mock_emitter])
    end
  end

  describe "GET show" do
    it "assigns the requested emitter as @emitter" do
      Emitter.stub(:find).with("37") { mock_emitter }
      get :show, :id => "37"
      assigns(:emitter).should be(mock_emitter)
    end
  end

  describe "GET new" do
    it "assigns a new emitter as @emitter" do
      Emitter.stub(:new) { mock_emitter }
      get :new
      assigns(:emitter).should be(mock_emitter)
    end
  end

  describe "GET edit" do
    it "assigns the requested emitter as @emitter" do
      Emitter.stub(:find).with("37") { mock_emitter }
      get :edit, :id => "37"
      assigns(:emitter).should be(mock_emitter)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created emitter as @emitter" do
        Emitter.stub(:new).with({'these' => 'params'}) { mock_emitter(:save => true) }
        post :create, :emitter => {'these' => 'params'}
        assigns(:emitter).should be(mock_emitter)
      end

      it "redirects to the created emitter" do
        Emitter.stub(:new) { mock_emitter(:save => true) }
        post :create, :emitter => {}
        response.should redirect_to(emitter_url(mock_emitter))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved emitter as @emitter" do
        Emitter.stub(:new).with({'these' => 'params'}) { mock_emitter(:save => false) }
        post :create, :emitter => {'these' => 'params'}
        assigns(:emitter).should be(mock_emitter)
      end

      it "re-renders the 'new' template" do
        Emitter.stub(:new) { mock_emitter(:save => false) }
        post :create, :emitter => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested emitter" do
        Emitter.should_receive(:find).with("37") { mock_emitter }
        mock_emitter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :emitter => {'these' => 'params'}
      end

      it "assigns the requested emitter as @emitter" do
        Emitter.stub(:find) { mock_emitter(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:emitter).should be(mock_emitter)
      end

      it "redirects to the emitter" do
        Emitter.stub(:find) { mock_emitter(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(emitter_url(mock_emitter))
      end
    end

    describe "with invalid params" do
      it "assigns the emitter as @emitter" do
        Emitter.stub(:find) { mock_emitter(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:emitter).should be(mock_emitter)
      end

      it "re-renders the 'edit' template" do
        Emitter.stub(:find) { mock_emitter(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested emitter" do
      Emitter.should_receive(:find).with("37") { mock_emitter }
      mock_emitter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the emitters list" do
      Emitter.stub(:find) { mock_emitter }
      delete :destroy, :id => "1"
      response.should redirect_to(emitters_url)
    end
  end

end
