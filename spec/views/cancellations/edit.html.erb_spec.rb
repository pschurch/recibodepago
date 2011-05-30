require 'spec_helper'

describe "cancellations/edit.html.erb" do
  before(:each) do
    @cancellation = assign(:cancellation, stub_model(Cancellation,
      :new_record? => false,
      :message => "MyText",
      :description => "MyText",
      :state => false
    ))
  end

  it "renders the edit cancellation form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => cancellation_path(@cancellation), :method => "post" do
      assert_select "textarea#cancellation_message", :name => "cancellation[message]"
      assert_select "textarea#cancellation_description", :name => "cancellation[description]"
      assert_select "input#cancellation_state", :name => "cancellation[state]"
    end
  end
end
