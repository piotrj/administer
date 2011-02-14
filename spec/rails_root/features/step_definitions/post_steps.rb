Given /^no posts exist$/ do
  Post.destroy_all
end

Given /^following posts exists:$/ do |posts_table|
  Post.destroy_all
  posts_table.hashes.each do |attributes|
    Factory(:post, attributes)
  end
end

Then /^there should be no posts$/ do
  Post.all.should be_empty
end

Then /^following posts should exist:$/ do |posts_table|
  posts_table.hashes.each do |attributes|
    category = attributes.delete("category_name")
    post = Post.first(:conditions => attributes)
    post.should_not be_nil
    post.category.name.should == category if category
  end
end

