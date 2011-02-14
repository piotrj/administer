Given /^following categories exist:$/ do |categories_table|
  Category.destroy_all
  categories_table.hashes.each do |attributes|
    Factory(:category, attributes)
  end
end