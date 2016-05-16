
Given /the following students exist/ do |student_table|
  student_table.hashes.each do |student|
   Student.create! student
  end
end
