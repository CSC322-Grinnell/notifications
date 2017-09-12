require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :student_name => "Student Name",
      :Parent_Name => "Parent Name",
      :Phone_Number => "Phone Number",
      :Email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Student Name/)
    rendered.should match(/Parent Name/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Email/)
  end
end
