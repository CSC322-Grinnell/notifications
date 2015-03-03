
ActiveRecord::Schema.define(:version => 201_411_191_706_47) do
  create_table 'parents', :force => true do |t|
    t.string 'name'
    t.string 'phoneNumber'
    t.string 'childName'
    t.string 'class'
    t.datetime 'created_at', :null => false
    t.datetime 'updated_at', :null => false
  end

  create_table 'students', :force => true do |t|
    t.string 'Student_Name'
    t.string 'Parent_Name'
    t.string 'Phone_Number'
    t.string 'Email'
    t.datetime 'created_at', :null => false
    t.datetime 'updated_at', :null => false
  end

  create_table 'user_sessions', :force => true do |t|
    t.string 'session_id', :null => false
    t.text 'data'
    t.datetime 'created_at', :null => false
    t.datetime 'updated_at', :null => false
  end

  add_index 'user_sessions',
            ['session_id'],
            :name => 'index_user_sessions_on_session_id'
  add_index 'user_sessions',
            ['updated_at'],
            :name => 'index_user_sessions_on_updated_at'

  create_table 'users', :force => true do |t|
    t.string 'name', :default => '', :null => false
    t.string 'login', :null => false
    t.string 'crypted_password', :null => false
    t.string 'password_salt', :null => false
    t.string 'email', :null => false
    t.string 'persistence_token', :null => false
    t.string 'single_access_token', :null => false
    t.string 'perishable_token', :null => false
    t.integer 'login_count', :default => 0,  :null => false
    t.integer 'failed_login_count', :default => 0,  :null => false
    t.datetime 'last_request_at'
    t.datetime 'current_login_at'
    t.datetime 'last_login_at'
    t.string 'current_login_ip'
    t.string 'last_login_ip'
    t.datetime 'created_at', :null => false
    t.datetime 'updated_at', :null => false
  end
end
