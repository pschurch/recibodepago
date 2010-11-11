require "spec_helper"

describe PrincipalsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/principals" }.should route_to(:controller => "principals", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/principals/new" }.should route_to(:controller => "principals", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/principals/1" }.should route_to(:controller => "principals", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/principals/1/edit" }.should route_to(:controller => "principals", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/principals" }.should route_to(:controller => "principals", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/principals/1" }.should route_to(:controller => "principals", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/principals/1" }.should route_to(:controller => "principals", :action => "destroy", :id => "1")
    end

  end
end
