require "spec_helper"

describe PaymentAgreementsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/payment_agreements" }.should route_to(:controller => "payment_agreements", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/payment_agreements/new" }.should route_to(:controller => "payment_agreements", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/payment_agreements/1" }.should route_to(:controller => "payment_agreements", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/payment_agreements/1/edit" }.should route_to(:controller => "payment_agreements", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/payment_agreements" }.should route_to(:controller => "payment_agreements", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/payment_agreements/1" }.should route_to(:controller => "payment_agreements", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/payment_agreements/1" }.should route_to(:controller => "payment_agreements", :action => "destroy", :id => "1")
    end

  end
end
