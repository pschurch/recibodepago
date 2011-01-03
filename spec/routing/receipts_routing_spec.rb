require "spec_helper"

describe ReceiptsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/receipts" }.should route_to(:controller => "receipts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/receipts/new" }.should route_to(:controller => "receipts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/receipts/1" }.should route_to(:controller => "receipts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/receipts/1/edit" }.should route_to(:controller => "receipts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/receipts" }.should route_to(:controller => "receipts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/receipts/1" }.should route_to(:controller => "receipts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/receipts/1" }.should route_to(:controller => "receipts", :action => "destroy", :id => "1")
    end

  end
end
