require 'spec_helper'

describe SupervisorController do

  describe "GET 'stmod'" do
    it "should be successful" do
      get 'stmod'
      response.should be_success
    end
  end

  describe "GET 'stlist'" do
    it "should be successful" do
      get 'stlist'
      response.should be_success
    end
  end

  describe "GET 'srlist'" do
    it "should be successful" do
      get 'srlist'
      response.should be_success
    end
  end

end
