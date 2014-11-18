require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :name => "Name",
        :phoneNumber => "Phone Number",
        :childName => "Child Name",
        :childGrade => "Child Grade"
      ),
      stub_model(Person,
        :name => "Name",
        :phoneNumber => "Phone Number",
        :childName => "Child Name",
        :childGrade => "Child Grade"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Child Name".to_s, :count => 2
    assert_select "tr>td", :text => "Child Grade".to_s, :count => 2
  end
end
