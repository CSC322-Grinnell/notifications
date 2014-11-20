Given /the following students exist/ do |student_table|
  student_table.hashes.each do |student|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  
   Student.create! student
end
end
