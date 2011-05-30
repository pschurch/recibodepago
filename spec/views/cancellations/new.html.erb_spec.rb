require 'spec_helper'

describe "cancellations/new.html.erb" do
  before(:each) do
    assign(:cancellation, stub_model(Cancellation,
      :message => "MyText",
      :description => "MyText",
      :state => false
    ).as_new_record)
  end

  it "renders new cancellation form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => cancellations_path, :method => "post" do
      assert_select "textarea#cancellation_message", :name => "cancellation[message]"
      assert_select "textarea#cancellation_description", :name => "cancellation[description]"
      assert_select "input#cancellation_state", :name => "cancellation[state]"
    end
  end
end
