require 'spec_helper'

describe FieldUsersController do

  def mock_field_user(stubs={})
    (@mock_field_user ||= mock_model(FieldUser).as_null_object).tap do |field_user|
      field_user.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all field_users as @field_users" do
      FieldUser.stub(:all) { [mock_field_user] }
      get :index
      assigns(:field_users).should eq([mock_field_user])
    end
  end

  describe "GET show" do
    it "assigns the requested field_user as @field_user" do
      FieldUser.stub(:find).with("37") { mock_field_user }
      get :show, :id => "37"
      assigns(:field_user).should be(mock_field_user)
    end
  end

  describe "GET new" do
    it "assigns a new field_user as @field_user" do
      FieldUser.stub(:new) { mock_field_user }
      get :new
      assigns(:field_user).should be(mock_field_user)
    end
  end

  describe "GET edit" do
    it "assigns the requested field_user as @field_user" do
      FieldUser.stub(:find).with("37") { mock_field_user }
      get :edit, :id => "37"
      assigns(:field_user).should be(mock_field_user)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created field_user as @field_user" do
        FieldUser.stub(:new).with({'these' => 'params'}) { mock_field_user(:save => true) }
        post :create, :field_user => {'these' => 'params'}
        assigns(:field_user).should be(mock_field_user)
      end

      it "redirects to the created field_user" do
        FieldUser.stub(:new) { mock_field_user(:save => true) }
        post :create, :field_user => {}
        response.should redirect_to(field_user_url(mock_field_user))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved field_user as @field_user" do
        FieldUser.stub(:new).with({'these' => 'params'}) { mock_field_user(:save => false) }
        post :create, :field_user => {'these' => 'params'}
        assigns(:field_user).should be(mock_field_user)
      end

      it "re-renders the 'new' template" do
        FieldUser.stub(:new) { mock_field_user(:save => false) }
        post :create, :field_user => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested field_user" do
        FieldUser.should_receive(:find).with("37") { mock_field_user }
        mock_field_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :field_user => {'these' => 'params'}
      end

      it "assigns the requested field_user as @field_user" do
        FieldUser.stub(:find) { mock_field_user(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:field_user).should be(mock_field_user)
      end

      it "redirects to the field_user" do
        FieldUser.stub(:find) { mock_field_user(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(field_user_url(mock_field_user))
      end
    end

    describe "with invalid params" do
      it "assigns the field_user as @field_user" do
        FieldUser.stub(:find) { mock_field_user(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:field_user).should be(mock_field_user)
      end

      it "re-renders the 'edit' template" do
        FieldUser.stub(:find) { mock_field_user(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested field_user" do
      FieldUser.should_receive(:find).with("37") { mock_field_user }
      mock_field_user.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the field_users list" do
      FieldUser.stub(:find) { mock_field_user }
      delete :destroy, :id => "1"
      response.should redirect_to(field_users_url)
    end
  end

end
