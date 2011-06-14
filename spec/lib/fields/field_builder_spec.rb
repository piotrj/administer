require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Administer::Fields::FieldBuilder do
  it "you can register class that would get converted into field" do
    Administer::Fields::FieldBuilder.register_class ActiveRecord::ConnectionAdapters::Column do
      TextField
    end
    Administer::Fields::FieldBuilder.class_variable_get(:@@registered_classes)[ActiveRecord::ConnectionAdapters::Column].should_not be_nil
  end
end
