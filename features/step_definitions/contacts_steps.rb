Given /the following contacts exist/ do |contact_table|
  contact_table.hashes.each do |contact|
   Contact.create! contact
  end
end