# Controls the flow of text messages to members of the Head Start Schools
class TextController < ApplicationController
  require 'rubygems'
  require 'twilio-ruby'
  before_filter :require_user

  def index
    @classrooms = @current_user.getClassrooms
    puts "Classrooms:"
    puts @classrooms

  end

  def post
    text = params[:message]
    student_ids = params[:students]

    message = Message.create(contents: text, user: @user)

    student_ids.each do |id|
      student = Student.find_by_id(id)
      Receipt.create(message: message, student: student)
    end
    message.send()
    redirect_to '/history'
  end

#   def create
#     @invalid_num = Array[]
#     @unavailable_num = Array[]
#     @num_texts = 0
#     if params[:commit] == 'Send To All!'
#       send_to_all
#     else
#       num = params[:number].to_s.delete! '[\"]'
#       mult_nums = num.split(', ')
#       @num_texts = mult_nums.length
#
#       mult_nums.each do |val|
#         if digit?(val)
#           send_text(val)
#         else
#           a_num = find_number(val)
#           if !a_num.nil?
#             if available?(val) && a_num != 'none'
#               send_text(a_num)
#             else
#               @unavailable_num << val
#             end
#           else
#             @invalid_num << val
#           end
#         end
#       end
#     end
#
#     handle_flash_notices(num)
#     render('index')
#   end
#
#   def handle_flash_notices(num)
#     if @invalid_num.length != 0
#       if @invalid_num[0] == 'No Message'
#         flash[:notice] = 'Message Required'
#         @pop_value = num
#       else
#         inv_num = @invalid_num.to_s.delete! '\"'
#         flash[:notice] = "The contact(s) #{inv_num} are invalid,
#                           others sent successfully"
#         inv_num.delete! '[]'
#         @pop_value = inv_num
#       end
#     else
#       if @unavailable_num.any?
#         una_num = @unavailable_num.to_s.delete! '\"'
#         flash[:notice] = "The contact(s) #{una_num} cannot be contacted via text,
#                           others sent successfully"
#         una_num.delete! '[]'
#         @pop_value = una_num
#       else
#         unless @num_texts.nil?
#           if @num_texts > 1
#             flash[:notice] = 'Messages sent successfully.'
#           else
#             flash[:notice] = 'Message sent successfully.'
#           end
#         else
#           flash[:notice] = 'Messages sent successfully.'
#         end
#       end
#     end
#   end
#
#   def send_text(number)
#     if params[:message] == ['']
#       @invalid_num << 'No Message'
#     elsif number.match(/\b\d{10}\b/)
#       number = '+1' + number
#       send_to_twillio(number)
#     else
#       @invalid_num << number
#     end
#   end
#
#   # Determines whether or not the first digit of the given string is
#   # a digit.
#   def digit?(value)
#     value[0].match(/\d/)
#   end
#
#   # Finds the number of a student or parent given their name.
#   # Returns nil if a number is not found.
#   def find_number(name)
#     a_name = Student.find_by_Student_Name(name)
#     unless a_name.nil?
#       return 'none' if a_name.Phone_Number.empty?
#       return a_name.Phone_Number
#     end
#
#     a_name = Student.find_by_Parent_Name(name)
#     unless a_name.nil?
#       return 'none' if a_name.Phone_Number.empty?
#       return a_name.Phone_Number
#     end
#   end
#
#   def available?(name)
#     a_name = Student.find_by_Student_Name(name)
#     if a_name.nil?
#       a_name = Student.find_by_Parent_Name(name)
#     end
#     return a_name.can_text unless a_name.nil?
#   end
#
#   def parse_classroom
#     a_classroom_name = Classroom.find_by_id(@classroom_id).name
#
#     Student.find_all_by_classroom_name(a_classroom_name).each do |student|
#       @pop_value += student.Student_Name + ', '
#     end
#     @pop_value = @pop_value[0..-3]
#   end
end
