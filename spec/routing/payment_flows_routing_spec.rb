require "spec_helper"

describe PaymentFlowsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/payment_flows" }.should route_to(:controller => "payment_flows", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/payment_flows/new" }.should route_to(:controller => "payment_flows", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/payment_flows/1" }.should route_to(:controller => "payment_flows", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/payment_flows/1/edit" }.should route_to(:controller => "payment_flows", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/payment_flows" }.should route_to(:controller => "payment_flows", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/payment_flows/1" }.should route_to(:controller => "payment_flows", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/payment_flows/1" }.should route_to(:controller => "payment_flows", :action => "destroy", :id => "1")
    end

  end
end
