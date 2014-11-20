require 'spec_helper'

describe "students/index" do
  before(:each) do
    assign(:students, [
      stub_model(Student,
        :Student_Name => "Student Name",
        :Parent_Name => "Parent Name",
        :Phone_Number => "Phone Number",
        :Email => "Email"
      ),
      stub_model(Student,
        :Student_Name => "Student Name",
        :Parent_Name => "Parent Name",
        :Phone_Number => "Phone Number",
        :Email => "Email"
      )
    ])
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Student Name".to_s, :count => 2
    assert_select "tr>td", :text => "Parent Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
