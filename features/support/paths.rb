# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the students page$/ then '/students'
    when /^the details page for \"(.*)\"/i
      student_path(Student.find_by_Student_Name($1))
    when /^the edit page for \"(.*)\"/i
      edit_student_path(Student.find_by_Student_Name($1))
    when /^the text page$/ then '/text'
    when /^the new user page$/ then '/signup'
    when /^the login page$/ then '/login'
    when /^the user page$/ then '/user'
    when /^the classroom page$/ then '/classrooms'
    when /^the classroom details page for \"(.*)\"/i
       classroom_path(Classroom.find_by_name($1))
    # Ad more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
