require "spec_helper"

describe PaymentFormsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/payment_forms" }.should route_to(:controller => "payment_forms", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/payment_forms/new" }.should route_to(:controller => "payment_forms", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/payment_forms/1" }.should route_to(:controller => "payment_forms", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/payment_forms/1/edit" }.should route_to(:controller => "payment_forms", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/payment_forms" }.should route_to(:controller => "payment_forms", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/payment_forms/1" }.should route_to(:controller => "payment_forms", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/payment_forms/1" }.should route_to(:controller => "payment_forms", :action => "destroy", :id => "1")
    end

  end
end
