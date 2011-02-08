require 'spec_helper'

describe DesignerController do

  describe "GET 'cdsg'" do
    it "should be successful" do
      get 'cdsg'
      response.should be_success
    end
  end

  describe "GET 'tdsg'" do
    it "should be successful" do
      get 'tdsg'
      response.should be_success
    end
  end

  describe "GET 'rdsg'" do
    it "should be successful" do
      get 'rdsg'
      response.should be_success
    end
  end

end
