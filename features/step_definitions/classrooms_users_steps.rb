Given /the following classrooms_users/ do |classrooms_users|
  classrooms_users.hashes.each do |row|
  	user = User.find(row[1])
  	Classroom.find(row[0]) << user

  end
end
