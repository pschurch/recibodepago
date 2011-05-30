require "spec_helper"

describe CancellationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cancellations" }.should route_to(:controller => "cancellations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cancellations/new" }.should route_to(:controller => "cancellations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cancellations/1" }.should route_to(:controller => "cancellations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cancellations/1/edit" }.should route_to(:controller => "cancellations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cancellations" }.should route_to(:controller => "cancellations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cancellations/1" }.should route_to(:controller => "cancellations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cancellations/1" }.should route_to(:controller => "cancellations", :action => "destroy", :id => "1")
    end

  end
end
