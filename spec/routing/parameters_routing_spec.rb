require "spec_helper"

describe ParametersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/parameters" }.should route_to(:controller => "parameters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/parameters/new" }.should route_to(:controller => "parameters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/parameters/1" }.should route_to(:controller => "parameters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/parameters/1/edit" }.should route_to(:controller => "parameters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/parameters" }.should route_to(:controller => "parameters", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/parameters/1" }.should route_to(:controller => "parameters", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/parameters/1" }.should route_to(:controller => "parameters", :action => "destroy", :id => "1")
    end

  end
end
