require "spec_helper"

describe PaymentPoliciesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/payment_policies" }.should route_to(:controller => "payment_policies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/payment_policies/new" }.should route_to(:controller => "payment_policies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/payment_policies/1" }.should route_to(:controller => "payment_policies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/payment_policies/1/edit" }.should route_to(:controller => "payment_policies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/payment_policies" }.should route_to(:controller => "payment_policies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/payment_policies/1" }.should route_to(:controller => "payment_policies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/payment_policies/1" }.should route_to(:controller => "payment_policies", :action => "destroy", :id => "1")
    end

  end
end
