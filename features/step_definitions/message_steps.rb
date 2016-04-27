Given /the following messages exist/ do |message_table|
  message_table.hashes.each do |message|
   Message.create! message
  end
end
