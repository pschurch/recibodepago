require "spec_helper"

describe RejectionTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/rejection_types" }.should route_to(:controller => "rejection_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/rejection_types/new" }.should route_to(:controller => "rejection_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/rejection_types/1" }.should route_to(:controller => "rejection_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/rejection_types/1/edit" }.should route_to(:controller => "rejection_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/rejection_types" }.should route_to(:controller => "rejection_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/rejection_types/1" }.should route_to(:controller => "rejection_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/rejection_types/1" }.should route_to(:controller => "rejection_types", :action => "destroy", :id => "1")
    end

  end
end
