require "spec_helper"

describe PaymentPeriodsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/payment_periods" }.should route_to(:controller => "payment_periods", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/payment_periods/new" }.should route_to(:controller => "payment_periods", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/payment_periods/1" }.should route_to(:controller => "payment_periods", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/payment_periods/1/edit" }.should route_to(:controller => "payment_periods", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/payment_periods" }.should route_to(:controller => "payment_periods", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/payment_periods/1" }.should route_to(:controller => "payment_periods", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/payment_periods/1" }.should route_to(:controller => "payment_periods", :action => "destroy", :id => "1")
    end

  end
end
