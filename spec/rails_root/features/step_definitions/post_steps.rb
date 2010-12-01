Given /^no posts exist$/ do
  Post.destroy_all
end

Given /^following posts exists:$/ do |posts_table|
  Post.destroy_all
  posts_table.hashes.each do |attributes|
    Factory(:post, attributes)
  end
end
