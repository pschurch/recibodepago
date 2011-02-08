require 'spec_helper'

describe FinanceController do

  describe "GET 'ftlist'" do
    it "should be successful" do
      get 'ftlist'
      response.should be_success
    end
  end

  describe "GET 'frlist'" do
    it "should be successful" do
      get 'frlist'
      response.should be_success
    end
  end

  describe "GET 'fhlist'" do
    it "should be successful" do
      get 'fhlist'
      response.should be_success
    end
  end

  describe "GET 'frmlist'" do
    it "should be successful" do
      get 'frmlist'
      response.should be_success
    end
  end

end
