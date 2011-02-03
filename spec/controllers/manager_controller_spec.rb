require 'spec_helper'

describe ManagerController do

  describe "GET 'mtmod'" do
    it "should be successful" do
      get 'mtmod'
      response.should be_success
    end
  end

  describe "GET 'mtlist'" do
    it "should be successful" do
      get 'mtlist'
      response.should be_success
    end
  end

  describe "GET 'mrlist'" do
    it "should be successful" do
      get 'mrlist'
      response.should be_success
    end
  end

end
