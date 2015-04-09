class TextController < ApplicationController
  require 'rubygems'
  require 'twilio-ruby'
  before_filter :require_user

  def index
    puts '---------------'
    @pop_value = ''
    puts @pop_value
    students = Student.all
    @previous_page = request.referer
    unless @previous_page.nil?
      page_split = @previous_page.split(/(?<=classrooms\/)/)

      if page_split[0] == 'http://localhost:3000/classrooms/'
        a_classroom_name = Classroom.find_by_id(page_split[1]).name
        Student.find_all_by_classroom_name(a_classroom_name).each do |student|
          @pop_value += student.Student_Name + ', '
        end
        length = @pop_value.length
        @pop_value = @pop_value[0..-3]
       # @pop_value.slice!(length-2, length)
       puts '..............................'
        puts @pop_value
    end
  end
    
    puts @previous_page
  end

  def create
    @invalid_num = Array[]
    if params[:commit] == 'Send To All!'
      send_to_all
    else
      num = params[:number].to_s.delete! '[\"]'
      mult_nums = num.split(', ')
      num_texts = mult_nums.length

      mult_nums.each do |val|
        puts 'ggggggggggggggggggg val'
        puts val
        if digit?(val)
          send_text(val)
        else
          a_num = find_number(val)
          puts "---#{a_num}--- anum"
          if !a_num.nil? and a_num != 'none'
            send_text(a_num)
          else
            @invalid_num << val #val is not getting pushed onto invalid num when it is in the database
            puts '@inv num-----------'
            puts @invalid_num
          end
        end
      end
    end

    handle_flash_notices(num, num_texts)
    render('index')
  end

  def handle_flash_notices(num, num_texts)
    puts 'inval num--------------------------------'
    puts @invalid_num
    if @invalid_num.length != 0
      if @invalid_num[0] == 'No Message'
        flash[:notice] = 'Message Required'
       # @value = num
        @pop_value = num
      else
        inv_num = @invalid_num.to_s.delete! '\"'
        flash[:notice] = "The contact(s) #{inv_num} are invalid,
                          others sent successfully"
        inv_num.delete! '[]'
        #@value = inv_num
        @pop_value = inv_num
      end
    else
      @pop_value = ''
      if !num_texts.nil?
        if num_texts > 1
          flash[:notice] = 'Messages sent successfully.'
        else
          flash[:notice] = 'Message sent successfully.'
        end
      else
      	flash[:notice] = 'Messages sent successfully.'
      end
    end
  end

  def send_to_all
    students = Student.all
    students.each do |student|
    send_text(student.Phone_Number)
    end
  end

  def send_text(number)
    if params[:message] == ['']
      @invalid_num << 'No Message'
    elsif number.match(/\b\d{10}\b/)
      number = '+1' + number
      account_sid = 'ACc3ff9be899397461c075ffcf9e70f35a'
      auth_token = '48f209948887f585f820760a89915194'
      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.account.messages.create(body: params[:message],
                                                to: number,
                                                from: '+16412434422')
      puts message.sid
    else
      @invalid_num << number
    end
  end

  # Determines whether or not the first digit of the given string is
  # a digit.
  def digit?(value)
    value[0].match(/\d/)
  end

  # Finds the number of a student or parent given their name.
  # Returns nil if a number is not found.
  def find_number(name)
    a_name = Student.find_by_Student_Name(name)
    puts "ph-------#{a_name.Phone_Number}-----"
    puts a_name.Phone_Number.nil? #phone number is not nil
    puts a_name.Phone_Number.empty?
    unless a_name.nil?
     if a_name.Phone_Number.empty?
      return 'none'
     end
     return a_name.Phone_Number
   end
  #  return a_name.Phone_Number unless a_name.nil?

    a_name = Student.find_by_Parent_Name(name)
    #error on parents!!!!!!!!!
    return a_name.Phone_Number unless a_name.nil? or a_name.Phone_Number.nil?
  end
end
