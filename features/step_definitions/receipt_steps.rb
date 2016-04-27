Given /the following receipts exist/ do |receipt_table|
  receipt_table.hashes.each do |receipt|
   Receipt.create! receipt
  end
end
