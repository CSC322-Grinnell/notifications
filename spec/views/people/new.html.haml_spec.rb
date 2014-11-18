require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person,
      :name => "MyString",
      :phoneNumber => "MyString",
      :childName => "MyString",
      :childGrade => "MyString"
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", people_path, "post" do
      assert_select "input#person_name[name=?]", "person[name]"
      assert_select "input#person_phoneNumber[name=?]", "person[phoneNumber]"
      assert_select "input#person_childName[name=?]", "person[childName]"
      assert_select "input#person_childGrade[name=?]", "person[childGrade]"
    end
  end
end
