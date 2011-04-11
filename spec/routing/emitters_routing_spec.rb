require "spec_helper"

describe EmittersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/emitters" }.should route_to(:controller => "emitters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/emitters/new" }.should route_to(:controller => "emitters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/emitters/1" }.should route_to(:controller => "emitters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/emitters/1/edit" }.should route_to(:controller => "emitters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/emitters" }.should route_to(:controller => "emitters", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/emitters/1" }.should route_to(:controller => "emitters", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/emitters/1" }.should route_to(:controller => "emitters", :action => "destroy", :id => "1")
    end

  end
end
