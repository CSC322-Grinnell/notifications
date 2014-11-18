require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "MyString",
      :phoneNumber => "MyString",
      :childName => "MyString",
      :childGrade => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_path(@person), "post" do
      assert_select "input#person_name[name=?]", "person[name]"
      assert_select "input#person_phoneNumber[name=?]", "person[phoneNumber]"
      assert_select "input#person_childName[name=?]", "person[childName]"
      assert_select "input#person_childGrade[name=?]", "person[childGrade]"
    end
  end
end
