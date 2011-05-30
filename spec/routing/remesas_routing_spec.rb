require "spec_helper"

describe RemesasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/remesas" }.should route_to(:controller => "remesas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/remesas/new" }.should route_to(:controller => "remesas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/remesas/1" }.should route_to(:controller => "remesas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/remesas/1/edit" }.should route_to(:controller => "remesas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/remesas" }.should route_to(:controller => "remesas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/remesas/1" }.should route_to(:controller => "remesas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/remesas/1" }.should route_to(:controller => "remesas", :action => "destroy", :id => "1")
    end

  end
end
