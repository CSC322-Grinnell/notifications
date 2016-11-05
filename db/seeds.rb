
user = User.create(
  name: 'Administrator',
  password: 'pass',
  password_confirmation: 'pass',
  email: 'admin@example.com',
  login: 'admin@example.com',
  admin: true,
  #phone_number: '6419909034')
  phone_number: '5073849727')
 # :classroom_ids => 0)



classroom = Classroom.create(
  name: 'classroom1')
#  :user_ids => 0)

classroom2 = Classroom.create(
  name: 'classroom2')
  
student = Student.create(
  Student_Name: 'Matt Guthrie')
#  :classroom_ids => 0, #Classroom.where(:name => 'classroom1'),
#  :contact_ids => 0) #Contact.where(:name => 'John'))

student2 = Student.create(
  Student_Name: 'Bib Hanson')

contact = Contact.create(
  Name: 'John',
  Phone_Number: '5075813958',
  Email: 'guthriem@grinnell.edu')
#  :student_ids => 0) #Student.where(:name => 'Matt Guthrie'))

contact2 = Contact.create(
  Name: 'Seth',
  Phone_Number: '5073849727',
  Email: 'good@good.com')

user.classroom_ids = [classroom.id]
user.save

classroom.user_ids = [user.id]
classroom.save

classroom.student_ids = [student.id]
classroom.save

student.classroom_ids = [classroom.id]
student.save

student.contact_ids = [contact.id]
student.save

contact.student_ids = [student.id]
contact.save


classroom2.student_ids = [student2.id]
classroom2.save

student2.classroom_ids = [classroom2.id]
student2.save

student2.contact_ids = [contact2.id]
student2.save

contact2.student_ids = [student2.id]
contact2.save