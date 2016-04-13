Given /the following classrooms_users/ do |classrooms_users|
  classrooms_users.hashes.each do |row|
  	user = User.find(row[:user_id])
  	Classroom.find(row[:classroom_id]).users << user
  end
end
