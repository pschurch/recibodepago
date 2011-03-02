require 'spec_helper'

describe DesignerController do

  describe "GET 'del_reg'" do
    it "should be successful" do
      get 'del_reg'
      response.should be_success
    end
  end

end
