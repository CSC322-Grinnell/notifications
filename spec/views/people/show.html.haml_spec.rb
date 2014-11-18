require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "Name",
      :phoneNumber => "Phone Number",
      :childName => "Child Name",
      :childGrade => "Child Grade"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Child Name/)
    rendered.should match(/Child Grade/)
  end
end
