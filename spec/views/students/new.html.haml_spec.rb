require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :student_name => "MyString",
      :Parent_Name => "MyString",
      :Phone_Number => "MyString",
      :Email => "MyString"
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", students_path, "post" do
      assert_select "input#student_student_name[name=?]", "student[student_name]"
      assert_select "input#student_Parent_Name[name=?]", "student[Parent_Name]"
      assert_select "input#student_Phone_Number[name=?]", "student[Phone_Number]"
      assert_select "input#student_Email[name=?]", "student[Email]"
    end
  end
end
