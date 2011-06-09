Given /^following comments exist:$/ do |comments_table|
  Comment.destroy_all
  comments_table.hashes.each do |attributes|
    Factory(:comment, attributes)
  end
end
