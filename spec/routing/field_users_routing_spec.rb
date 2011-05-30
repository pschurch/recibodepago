require "spec_helper"

describe FieldUsersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/field_users" }.should route_to(:controller => "field_users", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/field_users/new" }.should route_to(:controller => "field_users", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/field_users/1" }.should route_to(:controller => "field_users", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/field_users/1/edit" }.should route_to(:controller => "field_users", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/field_users" }.should route_to(:controller => "field_users", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/field_users/1" }.should route_to(:controller => "field_users", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/field_users/1" }.should route_to(:controller => "field_users", :action => "destroy", :id => "1")
    end

  end
end
