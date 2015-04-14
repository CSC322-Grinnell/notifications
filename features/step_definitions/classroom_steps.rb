Given /the following classrooms exist/ do |classroom_table|
  classroom_table.hashes.each do |classroom|
   Classroom.create! classroom
end
end