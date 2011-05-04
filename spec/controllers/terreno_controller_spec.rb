require 'spec_helper'

describe TerrenoController do

  describe "GET 'ttlist'" do
    it "should be successful" do
      get 'ttlist'
      response.should be_success
    end
  end

end
